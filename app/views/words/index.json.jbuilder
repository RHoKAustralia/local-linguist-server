json.array!(@words) do |word|
  json.extract! word, :id, :english_text, :image, :study_id
  json.url word_url(word, format: :json)
end
