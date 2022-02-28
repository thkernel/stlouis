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

class TechnicalSheetItem < ApplicationRecord
  # Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  belongs_to :technical_sheet
  belongs_to :product
  belongs_to :unity

  # Change default params ID to uid
  def to_param
    uid
  end

end
