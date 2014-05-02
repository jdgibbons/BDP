json.array!(@work_orders) do |work_order|
  json.extract! work_order, :id, :invoice_id, :description, :quantity
  json.url work_order_url(work_order, format: :json)
end
