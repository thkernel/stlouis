# == Schema Information
#
# Table name: customers
#
#  id           :bigint           not null, primary key
#  uid          :string
#  company_name :string
#  first_name   :string
#  last_name    :string
#  civility     :string
#  address      :string
#  country      :string
#  city         :string
#  phone        :string
#  street       :string
#  po_box       :string
#  zip_code     :string
#  email        :string
#  description  :string
#  status       :string
#  account_id   :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Customer < ApplicationRecord
  
  # Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  has_one :account, as: :accountable
  has_one :customer_social_case, dependent: :destroy
  #accepts_nested_attributes_for :account
  #belongs_to :account
  has_many :orders, dependent: :destroy


  

  has_one_attached :avatar
  
  # Validations
  #validates :company_name,   uniqueness: true
  

  def customer_name
    if self.company_name.present?
     "#{company_name}"
    else
      "#{last_name} #{first_name}"
    end
  end

  # Get userable full name
  #def full_name
    #self.userable.full_name
  #end

  def full_name
    "#{first_name} #{last_name}"
  end
  

  # Change default params ID to uid
  def to_param
    uid
  end
end
