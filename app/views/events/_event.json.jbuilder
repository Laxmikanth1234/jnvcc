json.extract! event, :id, :name, :story, :when, :where, :contact, :user_id, :created_at, :updated_at
json.url event_url(event, format: :json)