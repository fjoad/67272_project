json.extract! user, :id, :email, :password_digest, :Employee_id, :created_at, :updated_at
json.url user_url(user, format: :json)
