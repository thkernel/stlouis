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

class FidelityCardSerializer < ActiveModel::Serializer
  attributes :id, :uid,  :status
  
  belongs_to :account
  #has_many :polls
  
end
