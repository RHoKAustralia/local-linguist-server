require 'zip'

# This represents an interview taken as part of a linguistics study at
# a particular locale.
#
# @author Craig Read
class Interview < ActiveRecord::Base
  after_commit :extract_zip
  belongs_to :study
  belongs_to :interviewer
  belongs_to :interviewee
  belongs_to :locale
  has_many :recordings

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
    save_audio
    interview_responses.each do |response|
      text_response = response.fetch('text_response', '')
      unless text_response.empty?
        puts response
      end
    end
  end

  def save_audio
    @audio_entries.each do |audio_file|
      puts audio_file
    end
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
