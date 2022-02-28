json.extract! stock_entry, :id, :uid, :product_id, :reason, :quantity, :description, :status, :account_id, :created_at, :updated_at
json.url stock_entry_url(stock_entry, format: :json)
