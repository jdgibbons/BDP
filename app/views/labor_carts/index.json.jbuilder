json.array!(@labor_carts) do |labor_cart|
  json.extract! labor_cart, :id
  json.url labor_cart_url(labor_cart, format: :json)
end
