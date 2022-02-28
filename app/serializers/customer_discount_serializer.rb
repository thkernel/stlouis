# == Schema Information
#
# Table name: customer_discounts
#
#  id          :bigint           not null, primary key
#  uid         :string
#  customer_id :bigint
#  amount      :float
#  status      :string
#  account_id  :bigint
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CustomerDiscountSerializer < ActiveModel::Serializer
  attributes :id, :uid, :amount, :status, :description
  has_one :customer
  has_one :account
end
