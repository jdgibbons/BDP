json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :contact, :telephone, :email
  json.url customer_url(customer, format: :json)
end
