# == Schema Information
#
# Table name: orders
#
#  id             :bigint           not null, primary key
#  uid            :string
#  customer_id    :bigint
#  table_id       :bigint
#  subtotal       :float            default(0.0)
#  total          :float            default(0.0)
#  tax            :float            default(0.0)
#  shipping       :float            default(0.0)
#  status         :string
#  paid           :string
#  payment_method :string
#  account_id     :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  vip_space      :boolean          default(FALSE)
#  social_case    :boolean          default(FALSE)
#

class OrderSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :uid, :customer_id, :account_id,   :status
  
  belongs_to :customer
  belongs_to :account
  has_many :order_items

  
  

end
