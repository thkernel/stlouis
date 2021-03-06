# == Schema Information
#
# Table name: quotes
#
#  id          :bigint           not null, primary key
#  uid         :string
#  customer_id :bigint
#  subtotal    :float            default(0.0)
#  total       :float            default(0.0)
#  tax         :float            default(0.0)
#  shipping    :float            default(0.0)
#  status      :string
#  account_id  :bigint
#

class QuoteSerializer < ActiveModel::Serializer
  attributes :id, :uid
end
