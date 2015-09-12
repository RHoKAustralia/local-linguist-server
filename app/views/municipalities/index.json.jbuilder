json.array!(@municipalities) do |municipality|
  json.extract! municipality, :id, :name, :region_id
  json.url municipality_url(municipality, format: :json)
end
