json.array!(@studies) do |study|
  json.extract! study, :id, :name, :start_date, :language_id
  json.url study_url(study, format: :json)

  json.phrases study.phrases do |phrase|
    json.extract! phrase, :id, :english_text, :audio, :image, :response_type_id
    json.url phrase_url(phrase, format: :json)
  end
end
