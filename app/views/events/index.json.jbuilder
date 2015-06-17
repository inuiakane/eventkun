json.array!(@events) do |event|
  json.extract! event, :id, :name, :info, :start_at, :end_at, :key
  json.url event_url(event, format: :json)
end
