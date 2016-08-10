json.array!(@phrases) do |phrase|
  json.extract! phrase, :id, :english_text, :audio, :image, :response_type_id
  json.url phrase_url(phrase, format: :json)
end
