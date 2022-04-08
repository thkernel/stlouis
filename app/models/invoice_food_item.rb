# == Schema Information
#
# Table name: invoice_food_items
#
#  id         :bigint           not null, primary key
#  uid        :string
#  invoice_id :bigint
#  food_id    :bigint
#  quantity   :float            default(0.0)
#  price      :float            default(0.0)
#  amount     :float            default(0.0)
#  status     :string
#

class InvoiceFoodItem < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  belongs_to :invoice
  belongs_to :food
  


	# Change default params ID to uid
  def to_param
    uid
  end

end
