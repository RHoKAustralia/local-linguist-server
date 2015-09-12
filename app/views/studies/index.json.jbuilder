json.array!(@studies) do |study|
  json.extract! study, :id, :name, :start_date, :language_id
  json.url study_url(study, format: :json)
end
