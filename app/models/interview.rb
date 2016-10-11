require 'zip'

# This represents an interview taken as part of a linguistics study at
# a particular locale.
#
# @author Craig Read
class Interview < ActiveRecord::Base
  include ApplicationHelper
  after_commit :extract_zip, on: [:create, :update]
  belongs_to :study
  belongs_to :interviewer
  belongs_to :interviewee
  belongs_to :locale
  has_many :recordings, dependent: :delete_all

  has_attached_file :zipfile,
                    url: '/assets/:class/:id/:style/:basename.:extension',
                    path: ':rails_root/public/assets/:class/:id/:style/:basename.:extension'

  validates :zipfile, attachment_content_type: { content_type: ['application/zip'] }

  delegate :name, to: :study, prefix: :study, nil: true
  delegate :name, to: :interviewer, prefix: :interviewer, nil: true
  delegate :name, to: :interviewee, prefix: :interviewee, nil: true
  delegate :name, to: :locale, prefix: :locale, nil: true

  def to_s
    "#{study_name}, #{locale_name}, #{interview_time}"
  end

  private

  def extract_zip
    Zip::File.open(zipfile.path) do |zip_file|
      @json_entry = zip_file.glob('*.json').first
      @audio_entries = zip_file.glob('*.mp4')
      save_interviewee if interviewee.nil? && validate_interviewee
      validate_zip_file && save_interview_responses
    end
  end

  def zipped_interview
    data = @json_entry.get_input_stream.read
    data ? JSON.parse(data) : {}
  end

  def interview_responses
    zipped_interview.fetch('interview', {}).fetch('recordings', [])
  end

  def save_interview_responses
    interview_responses.each do |response|
      recording = recordings.where(phrase_id: response.fetch('phrase_id', nil)).first_or_create

      text_response = response.fetch('text_response', '')
      recording.text_response = text_response

      audio_url = response.fetch('audio_url', nil)
      audio_response = @audio_entries.select { |a| a.name == audio_url }.first if audio_url
      if audio_response
        audio_file = StringIO.open(audio_response.get_input_stream.read)
        audio_file.class.class_eval { attr_accessor :original_filename, :content_type }
        audio_file.original_filename = audio_response.name
        audio_file.content_type = 'video/mp4' # TODO: WTF is this video?
        recording.audio = audio_file
      end

      recording.save
    end
  end

  def validate_interviewee
    return false if zipped_interview.fetch('interviewee', {}).empty?
    true
  end

  def save_interviewee
    itve = zipped_interview.fetch('interviewee', {})
    return if itve.empty?
    # TODO: The order of these seems WRONG!
    itve['locale_id'] ||= find_locale_id(itve['livesInMunicipality'],
                                         itve['livesInDistrict'],
                                         itve['livesInVillage'])
    interviewee = Interviewee.find_or_create_by(
      name: itve['name'],
      age: itve['age'],
      education_level: itve['education_level'],
      first_language: itve['first_language'],
      gender: itve['gender'],
      occupation: itve['occupation'],
      lived_whole_life: itve['lived_whole_life'],
      locale_id: itve['locale_id'])
    self.interviewee = interviewee
  end

  def validate_zip_file
    return false if @json_entry.nil?
    validate_audio_entries
  end

  def validate_audio_entries
    return true if @audio_entries.empty?
    interview_responses.each do |response|
      audio_url = response.fetch('audio_url', '')
      return false unless validate_audio_url(audio_url)
    end
    true
  end

  def validate_audio_url(audio_url)
    return true if audio_url.empty?
    @audio_entries.map(&:name).include? audio_url
  end
end
