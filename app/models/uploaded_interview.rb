require 'zip'

class UploadedInterview
  include ApplicationHelper
  attr_accessor :interviewee

  def initialize(params)
    @zipfile = params[:file]
  end

  def extract_zip
    Zip::File.open(@zipfile[:tempfile]) do |zip_file|
      @json_entry = zip_file.glob('*.json').first
      @audio_entries = zip_file.glob('*.mp4')
      save_interview
      save_interviewee if interviewee.nil? && validate_interviewee
      validate_zip_file && save_interview_responses
    end
  end

  private

  def zipped_interview
    data = @json_entry.get_input_stream.read
    data ? JSON.parse(data) : {}
  end

  def save_interview
    Rails.logger.debug interview_params
    @interview = Interview.create(interview_params)
  end

  # TODO: interviewer and interviewee
  def interview_params
    zi = zipped_interview['interview']
    {
      study_id: zi['study_id'],
      interview_time: DateTime.strptime(zi['interview_time'], '/Date(%s-0000)/'),
      locale_id: zi['locale_id'],
      language_id: zi['language_id']
    }
  end

  def interview_responses
    zipped_interview.fetch('interview', {}).fetch('recordings', [])
  end

  def save_interview_responses
    interview_responses.each do |response|
      recording = @interview.recordings \
                  .where(phrase_id: response.fetch('phrase_id', nil)) \
                  .first_or_create

      text_response = response.fetch('text_response', '')
      recording.text_response = text_response

      audio_url = response.fetch('audio_url', nil)
      audio_response = @audio_entries.find { |a| a.name == audio_url } if audio_url
      save_audio_response(audio_response, recording) if audio_response

      recording.save
    end
  end

  def save_audio_response(audio_response, recording)
    audio_file = StringIO.open(audio_response.get_input_stream.read)
    audio_file.class.class_eval { attr_accessor :original_filename, :content_type }
    audio_file.original_filename = audio_response.name
    audio_file.content_type = 'video/mp4' # TODO: WTF is this video?
    recording.audio = audio_file
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
