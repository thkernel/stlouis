# == Schema Information
#
# Table name: stock_movements
#
#  id            :bigint           not null, primary key
#  uid           :string
#  movement_type :string
#  product_id    :bigint
#  unity_id      :bigint
#  quantity      :float
#  description   :text
#  account_id    :bigint
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class StockMovementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
