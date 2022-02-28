# == Schema Information
#
# Table name: order_item_drinks
#
#  id         :bigint           not null, primary key
#  order_id   :bigint
#  product_id :bigint
#  quantity   :float
#  unit_price :float
#  amount     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class OrderItemDrinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
