class InventorySerializer < ActiveModel::Serializer
  attributes :id, :uid, :inventory_date, :current_stock, :stock_real, :difference, :description, :status
  has_one :product
  has_one :account
end
