# == Schema Information
#
# Table name: views
#
#  id         :bigint           not null, primary key
#  uid        :string
#  poll_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ViewSerializer < ActiveModel::Serializer
  attributes :id, :uid, :user_id
  has_one :poll
end
