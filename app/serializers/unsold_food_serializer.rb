# == Schema Information
#
# Table name: unsold_foods
#
#  id          :bigint           not null, primary key
#  uid         :string
#  food_id     :bigint
#  quantity    :float
#  status      :string
#  description :text
#  account_id  :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class UnsoldFoodSerializer < ActiveModel::Serializer
  attributes :id, :uid, :quantity, :status, :description
  has_one :food
  has_one :account
end
