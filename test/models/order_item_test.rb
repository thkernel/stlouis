# == Schema Information
#
# Table name: order_items
#
#  id         :bigint           not null, primary key
#  uid        :string
#  order_id   :bigint
#  food_id    :bigint
#  quantity   :float            default(0.0)
#  price      :float            default(0.0)
#  amount     :float            default(0.0)
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint
#

require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
