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

class CustomerFidelityCardSerializer < ActiveModel::Serializer
  attributes :id, :uid, :customer_id, :fidelity_card_id,  :status
  
  belongs_to :customer
  belongs_to :fidelity_card
  belongs_to :account
end
