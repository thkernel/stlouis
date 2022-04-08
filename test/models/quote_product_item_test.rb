# == Schema Information
#
# Table name: quote_product_items
#
#  id         :bigint           not null, primary key
#  uid        :string
#  quote_id   :bigint
#  product_id :bigint
#  quantity   :float            default(0.0)
#  unit_price :float            default(0.0)
#  amount     :float            default(0.0)
#  status     :string
#

require 'test_helper'

class QuoteProductItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
