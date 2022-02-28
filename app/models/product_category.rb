# == Schema Information
#
# Table name: product_categories
#
#  id          :bigint           not null, primary key
#  uid         :string
#  slug        :string
#  name        :string
#  description :string
#  account_id  :bigint
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ProductCategory < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  belongs_to :account

  validates :name, presence: true, uniqueness: true



	# Change default params ID to uid
  def to_param
    uid
  end
  
end
