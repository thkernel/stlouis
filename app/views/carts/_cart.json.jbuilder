json.extract! cart, :id, :uid, :status, :created_at, :updated_at
json.url cart_url(cart, format: :json)
