json.extract! unsold_food, :id, :uid, :food_id, :quantity, :status, :description, :account_id, :created_at, :updated_at
json.url unsold_food_url(unsold_food, format: :json)
