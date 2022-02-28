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

class Partner < ApplicationRecord
  belongs_to :account


  # Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid


  def full_name
    "#{first_name} #{last_name}"
  end
  

	# Change default params ID to uid
  def to_param
    uid
  end


  # Validations
  #validates :company_name,   uniqueness: true
  

  def partner_name
    if self.company_name.present?
      "#{company_name}"
    else
      "#{last_name} #{first_name}"
    end
  end
  
end
