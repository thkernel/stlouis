# == Schema Information
#
# Table name: customer_social_cases
#
#  id           :bigint           not null, primary key
#  uid          :string
#  customer_id  :bigint
#  dish_number  :integer
#  time_unit_id :bigint
#  status       :string
#  account_id   :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class CustomerSocialCase < ApplicationRecord
   # Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid, :set_status

  belongs_to :customer
  belongs_to :time_unit
  belongs_to :account

  # Change default params ID to uid
  def to_param
    uid
  end

  def set_status
    unless self.status.present?
      self.status = "Actif"
    end
  end
end
