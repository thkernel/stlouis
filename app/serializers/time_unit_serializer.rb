# == Schema Information
#
# Table name: time_units
#
#  id          :bigint           not null, primary key
#  uid         :string
#  name        :string
#  description :string
#  status      :string
#  account_id  :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class TimeUnitSerializer < ActiveModel::Serializer
  attributes :id, :uid, :name, :description, :status
  has_one :account
end
