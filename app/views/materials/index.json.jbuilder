json.array!(@materials) do |material|
  json.extract! material, :id, :name, :unit_type, :unit_price, :notes, :roll_cost
  json.url material_url(material, format: :json)
end
