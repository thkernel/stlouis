# == Schema Information
#
# Table name: votings
#
#  id           :bigint           not null, primary key
#  uid          :string
#  poll_item_id :bigint
#  status       :string
#  user_id      :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class VotingSerializer < ActiveModel::Serializer
  attributes :id, :uid, :poll_item_id, :status, :user_id
  
  belongs_to :poll_item
  belongs_to :user
end
