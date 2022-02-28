# == Schema Information
#
# Table name: order_item_drinks
#
#  id         :bigint           not null, primary key
#  order_id   :bigint
#  product_id :bigint
#  quantity   :float
#  unit_price :float
#  amount     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OrderItemDrinkSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :unit_price, :amount
  has_one :order
  has_one :product
end
