class Inventory < ApplicationRecord
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  belongs_to :product
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
