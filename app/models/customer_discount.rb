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

class CustomerDiscount < ApplicationRecord
  belongs_to :customer
  belongs_to :account
end
