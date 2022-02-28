# == Schema Information
#
# Table name: partners
#
#  id           :bigint           not null, primary key
#  uid          :string
#  company_name :string
#  first_name   :string
#  last_name    :string
#  civility     :string
#  address      :string
#  city         :string
#  country      :string
#  phone        :string
#  email        :string
#  description  :text
#  status       :string
#  account_id   :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class PartnerSerializer < ActiveModel::Serializer
  attributes :id, :uid, :company_name, :first_name, :last_name, :civility, :address, :city, :country, :phone, :email, :description, :status
  has_one :account
end
