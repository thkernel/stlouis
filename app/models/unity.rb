# == Schema Information
#
# Table name: unities
#
#  id           :bigint           not null, primary key
#  uid          :string
#  name         :string
#  unity_symbol :string
#  decription   :text
#  status       :string
#  account_id   :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Unity < ApplicationRecord
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
