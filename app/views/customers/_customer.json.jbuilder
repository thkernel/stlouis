json.extract! customer, :id, :full_name, :address, :city, :country, :phone, :slug, :status, :user_id, :created_at, :updated_at
json.url customer_url(customer, format: :json)
