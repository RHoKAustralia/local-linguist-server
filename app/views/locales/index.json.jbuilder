json.array!(@locales) do |locale|
  json.extract! locale, :id, :name, :municipality_id
  json.url locale_url(locale, format: :json)
end
