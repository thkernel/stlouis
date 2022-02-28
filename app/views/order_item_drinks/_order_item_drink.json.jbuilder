json.extract! order_item_drink, :id, :order_id, :product_id, :quantity, :unit_price, :amount, :created_at, :updated_at
json.url order_item_drink_url(order_item_drink, format: :json)
