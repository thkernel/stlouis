json.extract! food, :id, :uid, :slug, :name, :min_cooking_time, :max_cooking_time, :price, :descriptions, :status, :account_id, :created_at, :updated_at
json.url food_url(food, format: :json)
