json.user do
  json.(@user, :id, :email, :name,  :activated, :admin, :password_digest, :authentication_token, :created_at, :updated_at)
end