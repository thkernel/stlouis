# == Schema Information
#
# Table name: customer_fidelity_cards
#
#  id               :bigint           not null, primary key
#  uid              :string
#  customer_id      :bigint
#  fidelity_card_id :bigint
#  status           :string
#  account_id       :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class CustomerFidelityCard < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid, :set_status
  
  belongs_to :customer
  belongs_to :fidelity_card
  belongs_to :account

  # Change default params ID to uid
  def to_param
    uid
  end

  def set_status
    card = FidelityCard.find(self.fidelity_card.id)

    unless self.status.present?
      
      self.status = "Confirmée"

      if card.present?
        card.update_column(:status, "Active")
      end
    end
  end



end
