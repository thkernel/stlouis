# == Schema Information
#
# Table name: stock_movement_reasons
#
#  id          :bigint           not null, primary key
#  uid         :string
#  name        :string
#  description :text
#  account_id  :bigint
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class StockMovementReasonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
