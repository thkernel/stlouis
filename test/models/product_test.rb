# == Schema Information
#
# Table name: products
#
#  id                  :bigint           not null, primary key
#  uid                 :string
#  slug                :string
#  product_category_id :bigint
#  name                :string
#  unity_id            :bigint
#  bar_code            :string
#  unit_price          :float
#  provider_id         :bigint
#  reorder_threshold   :float
#  current_stock       :float            default(0.0)
#  description         :string
#  account_id          :bigint
#  status              :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
