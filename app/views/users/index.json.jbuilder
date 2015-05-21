json.array!(@users) do |user|
  json.extract! user, :id, :email, :password_digest, :nickname
  json.url user_url(user, format: :json)
end
