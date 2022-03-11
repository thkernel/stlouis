# == Schema Information
#
# Table name: gifts
#
#  id            :bigint           not null, primary key
#  uid           :string
#  customer_id   :bigint
#  food_quantity :float
#  bonus_number  :float
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class GiftSerializer < ActiveModel::Serializer
  attributes :id, :uid, :food_quantity, :bonus_number, :status
  has_one :customer
end
