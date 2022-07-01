json.extract! inventory, :id, :uid, :inventory_date, :product_id, :current_stock, :stock_real, :difference, :description, :status, :account_id, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
