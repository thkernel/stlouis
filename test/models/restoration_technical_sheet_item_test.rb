# == Schema Information
#
# Table name: restoration_technical_sheet_items
#
#  id                           :bigint           not null, primary key
#  uid                          :string
#  technical_sheet_id           :bigint
#  product_id                   :bigint
#  unity_id                     :bigint
#  unity_purchase_cost_excl_tax :float            default(0.0)
#  quantity                     :float            default(0.0)
#  cost_price_excl_tax          :float            default(0.0)
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

require 'test_helper'

class RestorationTechnicalSheetItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
