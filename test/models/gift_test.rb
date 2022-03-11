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

require 'test_helper'

class GiftTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
