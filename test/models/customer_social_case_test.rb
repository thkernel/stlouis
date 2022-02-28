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

require 'test_helper'

class CustomerSocialCaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
