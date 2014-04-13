json.array!(@material_carts) do |material_cart|
  json.extract! material_cart, :id
  json.url material_cart_url(material_cart, format: :json)
end
