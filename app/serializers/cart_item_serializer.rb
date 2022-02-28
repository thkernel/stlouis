# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  uid        :string
#  cart_id    :bigint
#  food_id    :bigint
#  product_id :bigint
#  quantity   :float            default(0.0)
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CartItemSerializer < ActiveModel::Serializer
  attributes :id, :uid
end
