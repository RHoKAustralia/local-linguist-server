json.array!(@recordings) do |recording|
  json.extract! recording, :id, :audio, :recorded, :interview_id, :language_id, :word_id
  json.url recording_url(recording, format: :json)
end
