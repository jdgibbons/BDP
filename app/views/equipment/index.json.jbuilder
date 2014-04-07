json.array!(@equipment) do |equipment|
  json.extract! equipment, :id, :name, :rate, :units
  json.url equipment_url(equipment, format: :json)
end
