json.extract! gift, :id, :uid, :customer_id, :food_quantity, :bonus_number, :status, :created_at, :updated_at
json.url gift_url(gift, format: :json)
