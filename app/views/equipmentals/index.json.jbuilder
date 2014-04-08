json.array!(@equipmentals) do |equipmental|
  json.extract! equipmental, :id, :name, :rate, :units
  json.url equipmental_url(equipmental, format: :json)
end
