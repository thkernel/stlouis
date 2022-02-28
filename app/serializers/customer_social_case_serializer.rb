# == Schema Information
#
# Table name: customer_social_cases
#
#  id           :bigint           not null, primary key
#  uid          :string
#  customer_id  :bigint
#  dish_number  :integer
#  time_unit_id :bigint
#  status       :string
#  account_id   :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class CustomerSocialCaseSerializer < ActiveModel::Serializer
  attributes :id, :uid, :dish_number, :status
  has_one :customer
  has_one :time_unit
  has_one :account
end
