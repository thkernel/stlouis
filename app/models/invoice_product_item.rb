# == Schema Information
#
# Table name: invoice_product_items
#
#  id         :bigint           not null, primary key
#  uid        :string
#  invoice_id :bigint
#  product_id :bigint
#  quantity   :float            default(0.0)
#  unit_price :float            default(0.0)
#  amount     :float            default(0.0)
#  status     :string
#

class InvoiceProductItem < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  belongs_to :invoice
  belongs_to :product
  


	# Change default params ID to uid
  def to_param
    uid
  end
end
