require 'zip'

class UploadedInterview
  include ApplicationHelper
  attr_accessor :interview, :interviewee, :interviewer, :language

  def initialize(params)
    @zipfile = params[:file]
  end

  def extract_zip
    Zip::File.open(@zipfile[:tempfile]) do |zip_file|
      @json_entry = zip_file.glob('*.json').first
      @audio_entries = zip_file.glob('*.mp4')
      save_interview
      save_interviewee if interviewee.nil?
      save_interviewer if interviewer.nil?
      validate_zip_file && save_interview_responses
      interview.save
    end
  end

  private

  def zipped_interview
    data = @json_entry.get_input_stream.read
    data ? JSON.parse(data) : {}
  end

  def save_interview
    @interview = Interview.create(interview_params)
  end

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

  def save_interviewee
    itve = zipped_interview.fetch('interviewee', {})
    return if itve.empty?

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
    interview.interviewee = interviewee
    # TODO: This should be the language the interview was performed in
    interview.language = Language.find_by_name(itve['first_language'])
    # TODO: Should this be where the interview occurred, not where the participant lived?
    interview.locale ||= Locale.find(itve['locale_id'])
  end

  def save_interviewer
    itvr = zipped_interview.fetch('interviewer', {})
    return if itvr.empty?

    interviewer = Interviewer.find_or_create_by(
      name: itvr['name'],
      mobile: itvr['mobile'],
      device_id: itvr['device_id'],
      email: itvr['email'])
    interview.interviewer = interviewer
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
