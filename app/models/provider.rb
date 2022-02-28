# == Schema Information
#
# Table name: providers
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
#  description  :string
#  status       :string
#  account_id   :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Provider < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  belongs_to :account


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


  # Validations
  #validates :company_name,   uniqueness: true
  

  def provider_name
    if self.company_name.present?
      "#{company_name}"
    else
      "#{last_name} #{first_name}"
    end
  end

  
end
