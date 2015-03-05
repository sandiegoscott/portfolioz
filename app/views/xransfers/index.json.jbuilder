json.array!(@xransfers) do |xransfer|
  json.extract! xransfer, :id
  json.url xransfer_url(xransfer, format: :json)
end
