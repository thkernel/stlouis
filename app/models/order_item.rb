# == Schema Information
#
# Table name: order_items
#
#  id         :bigint           not null, primary key
#  uid        :string
#  order_id   :bigint
#  food_id    :bigint
#  quantity   :float            default(0.0)
#  price      :float            default(0.0)
#  amount     :float            default(0.0)
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint
#

class OrderItem < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  belongs_to :order
  belongs_to :food, optional: true
  belongs_to :product, optional: :true


	# Change default params ID to uid
  def to_param
    uid
  end
  
end
