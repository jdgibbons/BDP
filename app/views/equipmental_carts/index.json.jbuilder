json.array!(@equipmental_carts) do |equipmental_cart|
  json.extract! equipmental_cart, :id
  json.url equipmental_cart_url(equipmental_cart, format: :json)
end
