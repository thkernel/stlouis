# == Schema Information
#
# Table name: stock_entries
#
#  id          :bigint           not null, primary key
#  uid         :string
#  product_id  :bigint
#  reason      :string
#  quantity    :float            default(0.0)
#  unity_id    :bigint
#  description :text
#  status      :string
#  account_id  :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class StockEntry < ApplicationRecord

	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid, :raise_current_stock

  belongs_to :product
  belongs_to :account
   belongs_to :unity

  private

  def raise_current_stock
  	product = Product.find(self.product_id)
  	quantity = self.quantity.to_f

  	puts "CURRENT STOCK: #{self.quantity}"

  	if product.present? && quantity > 0.0

  		if product.current_stock.present?

  		current_stock = product.current_stock + quantity
  	else
  		current_stock = 0.0 + quantity
  	end
  		product.update_column(:current_stock, current_stock);
  	end
  end


end
