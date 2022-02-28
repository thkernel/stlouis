# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  uid          :string
#  poll_item_id :bigint
#  content      :text
#  status       :string
#  user_id      :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class CommentSerializer < ActiveModel::Serializer
  attributes :id, :uid, :poll_item_id, :content, :status, :user_id
  
  belongs_to :poll_item
  belongs_to :user
end
