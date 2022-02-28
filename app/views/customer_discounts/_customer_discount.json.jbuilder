json.extract! customer_discount, :id, :uid, :customer_id, :amount, :status, :account_id, :description, :created_at, :updated_at
json.url customer_discount_url(customer_discount, format: :json)
