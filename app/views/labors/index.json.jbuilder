json.array!(@labors) do |labor|
  json.extract! labor, :id, :name, :rate, :units
  json.url labor_url(labor, format: :json)
end
