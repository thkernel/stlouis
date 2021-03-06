# == Schema Information
#
# Table name: invoices
#
#  id             :bigint           not null, primary key
#  uid            :string
#  customer_id    :bigint
#  quote_id       :bigint
#  subtotal       :float            default(0.0)
#  total          :float            default(0.0)
#  tax            :float            default(0.0)
#  shipping       :float            default(0.0)
#  status         :string
#  paid           :string
#  payment_method :string
#  account_id     :bigint
#

class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :uid
end
