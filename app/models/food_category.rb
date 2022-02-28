# == Schema Information
#
# Table name: food_categories
#
#  id          :bigint           not null, primary key
#  uid         :string
#  name        :string
#  description :text
#  status      :string
#  account_id  :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class FoodCategory < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  belongs_to :account

  has_many :foods, dependent: :destroy

validates :name, presence: true, uniqueness: true

	# Change default params ID to uid
  def to_param
    uid
  end
  
end
