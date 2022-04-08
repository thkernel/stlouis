# == Schema Information
#
# Table name: invoice_food_items
#
#  id         :bigint           not null, primary key
#  uid        :string
#  invoice_id :bigint
#  food_id    :bigint
#  quantity   :float            default(0.0)
#  price      :float            default(0.0)
#  amount     :float            default(0.0)
#  status     :string
#

class InvoiceFoodItemSerializer < ActiveModel::Serializer
  attributes :id, :uid
end
