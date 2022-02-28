# == Schema Information
#
# Table name: api_keys
#
#  id           :bigint           not null, primary key
#  access_token :string
#  account_id   :bigint
#  expires_at   :datetime
#  active       :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ApiKeySerializer < ActiveModel::Serializer
  attributes :id, :access_token, :expires_at, :active
  has_one :account
end
