json.array!(@locales) do |locale|
  json.extract! locale, :id, :name, :region_id
  json.url locale_url(locale, format: :json)
end
