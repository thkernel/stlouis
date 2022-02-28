class DrinkTypeSerializer < ActiveModel::Serializer
  attributes :id, :uid, :name, :description, :status
  has_one :account
end
