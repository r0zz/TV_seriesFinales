json.extract! myuser, :id, :username, :password, :email, :watched, :created_at, :updated_at
json.url myuser_url(myuser, format: :json)
