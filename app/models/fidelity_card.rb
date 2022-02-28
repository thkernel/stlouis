# == Schema Information
#
# Table name: fidelity_cards
#
#  id         :bigint           not null, primary key
#  uid        :string
#  balance    :float            default(0.0)
#  status     :string
#  account_id :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FidelityCard < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid, :set_status

  belongs_to :account
  has_one :customer_fidelity_card


	# Change default params ID to uid
  def to_param
    uid
  end

  def set_status
  	unless self.status.present?
  		self.status = "Inactive"
  	end
  end
  
end
