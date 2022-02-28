# == Schema Information
#
# Table name: orders
#
#  id             :bigint           not null, primary key
#  uid            :string
#  customer_id    :bigint
#  table_id       :bigint
#  subtotal       :float            default(0.0)
#  total          :float            default(0.0)
#  tax            :float            default(0.0)
#  shipping       :float            default(0.0)
#  status         :string
#  paid           :string
#  payment_method :string
#  account_id     :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  vip_space      :boolean          default(FALSE)
#  social_case    :boolean          default(FALSE)
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
