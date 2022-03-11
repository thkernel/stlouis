class BonuSerializer < ActiveModel::Serializer
  attributes :id, :uid, :food_quantity, :bonus_number, :status
  has_one :customer
end
