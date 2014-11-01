json.array!(@listings) do |listing|
  json.extract! listing, :id, :name, :format, :location, :description, :price
  json.url listing_url(listing, format: :json)
end
