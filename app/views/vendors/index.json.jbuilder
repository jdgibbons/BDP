json.array!(@vendors) do |vendor|
  json.extract! vendor, :id, :description, :quantity, :cost
  json.url vendor_url(vendor, format: :json)
end
