json.array!(@equipmental_line_items) do |equipmental_line_item|
  json.extract! equipmental_line_item, :id, :equipmental_id, :equipmental_cart_id
  json.url equipmental_line_item_url(equipmental_line_item, format: :json)
end
