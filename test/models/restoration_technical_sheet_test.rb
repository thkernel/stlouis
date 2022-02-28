# == Schema Information
#
# Table name: restoration_technical_sheets
#
#  id                                        :bigint           not null, primary key
#  uid                                       :string
#  food_id                                   :bigint
#  portion_number                            :float            default(0.0)
#  sale_price_incl_vat                       :float            default(0.0)
#  vat_rate                                  :float            default(0.0)
#  total_cost_price_excl_tax                 :float            default(0.0)
#  produced_portion_unit_cost_price_excl_tax :float            default(0.0)
#  unsold_average_percentage                 :float            default(0.0)
#  sold_portion_unit_cost_price_excl_vat     :float            default(0.0)
#  selling_price_excl_tax                    :float            default(0.0)
#  gross_margin                              :float            default(0.0)
#  margin_rate                               :float            default(0.0)
#  margin_coefficient                        :float            default(0.0)
#  status                                    :string
#  account_id                                :bigint
#  created_at                                :datetime         not null
#  updated_at                                :datetime         not null
#

require 'test_helper'

class RestorationTechnicalSheetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
