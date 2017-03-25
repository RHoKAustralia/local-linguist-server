json.extract! @study, :id, :name, :start_date, :created_at, :updated_at
json.phrases @study.phrases.order(:id) do |phrase|
  json.extract! phrase, :id, :english_text, :audio, :image, :response_type_id, :choices
  json.url phrase_url(phrase, format: :json)
end
