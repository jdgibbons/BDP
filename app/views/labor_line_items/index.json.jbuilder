json.array!(@labor_line_items) do |labor_line_item|
  json.extract! labor_line_item, :id, :labor_id, :labor_cart_id
  json.url labor_line_item_url(labor_line_item, format: :json)
end
