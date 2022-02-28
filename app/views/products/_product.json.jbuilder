json.extract! product, :id, :name, :unity_id, :unit_price, :deposit_id, :status, :product_category_id, :user_id, :reorder_threshold, :created_at, :updated_at
json.url product_url(product, format: :json)
