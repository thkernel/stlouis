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

require 'test_helper'

class CustomerDiscountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
