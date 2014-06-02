json.array!(@messages) do |message|
  json.extract! message, :id, :author, :message
  json.url message_url(message, format: :json)
end
