json.extract! @interview, :id, :interview_time, :study_id, :interviewer_id, :interviewee_id, :locale_id, :created_at, :updated_at
json.interviewer @interview.interviewer
json.phrases @interview.phrases do |phrase|
  json.extract! phrase, :id, :english_text, :audio, :image, :response_type_id, :choices
  json.url phrase_url(phrase, format: :json)
end
json.recordings @interview.recordings do |recording|
  json.extract! recording, :id, :recorded, :audio_url, :text_response, :created_at, :updated_at
end
