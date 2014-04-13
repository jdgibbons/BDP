json.array!(@material_line_items) do |material_line_item|
  json.extract! material_line_item, :id, :material_id, :material_cart_id
  json.url material_line_item_url(material_line_item, format: :json)
end
