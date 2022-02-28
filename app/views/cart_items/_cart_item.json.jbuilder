json.extract! cart_item, :id, :uid, :cart_id, :product_id, :quantity, :status, :created_at, :updated_at
json.url cart_item_url(cart_item, format: :json)
