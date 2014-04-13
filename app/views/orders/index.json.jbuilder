json.array!(@orders) do |order|
  json.extract! order, :id, :quote_id, :work_order_id, :invoice_id, :description, :quantity
  json.url order_url(order, format: :json)
end
