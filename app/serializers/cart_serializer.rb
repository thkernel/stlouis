# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  uid        :string
#  account_id :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CartSerializer < ActiveModel::Serializer
  attributes :id, :uid
end
