json.extract! client, :id, :username, :created_at, :updated_at
json.url client_url(client, format: :json)
