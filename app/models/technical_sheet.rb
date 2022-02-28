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

class TechnicalSheet < ApplicationRecord
  # Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  belongs_to :food
  belongs_to :account

  has_many :technical_sheet_items, dependent: :destroy
  accepts_nested_attributes_for :technical_sheet_items ,  allow_destroy: true , :reject_if => :no_technical_sheet_items

  def no_technical_sheet_items(attributes)
    attributes[:product_id].blank?
  end

  # Change default params ID to uid
  def to_param
    uid
  end


end
