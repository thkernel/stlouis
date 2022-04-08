# == Schema Information
#
# Table name: quotes
#
#  id          :bigint           not null, primary key
#  uid         :string
#  customer_id :bigint
#  subtotal    :float            default(0.0)
#  total       :float            default(0.0)
#  tax         :float            default(0.0)
#  shipping    :float            default(0.0)
#  status      :string
#  account_id  :bigint
#

require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
