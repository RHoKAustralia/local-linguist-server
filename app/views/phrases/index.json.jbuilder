json.array!(@phrases) do |phrase|
  json.extract! phrase, :id, :english_text, :audio, :image
  json.url phrase_url(phrase, format: :json)
end
