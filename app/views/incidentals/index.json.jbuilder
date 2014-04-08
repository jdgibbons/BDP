json.array!(@incidentals) do |incidental|
  json.extract! incidental, :id, :description, :cost
  json.url incidental_url(incidental, format: :json)
end
