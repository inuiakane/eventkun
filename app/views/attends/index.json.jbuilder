json.array!(@attends) do |attend|
  json.extract! attend, :id, :event_id, :user_name, :attendance, :body
  json.url attend_url(attend, format: :json)
end
