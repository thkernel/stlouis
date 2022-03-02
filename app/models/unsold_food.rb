# == Schema Information
#
# Table name: unsold_foods
#
#  id          :bigint           not null, primary key
#  uid         :string
#  food_id     :bigint
#  quantity    :float
#  status      :string
#  description :text
#  account_id  :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class UnsoldFood < ApplicationRecord
  # Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid, :set_status

  
  belongs_to :food
  belongs_to :account


  def to_param
    uid
  end


  # Search
    def self.search(start_date, end_date)
        
        
      query = UnsoldFood.order(:created_at)
      query = query.where("DATE(created_at) BETWEEN ? AND ? ", start_date, end_date) if start_date.present? and  end_date.present?
      #query = query.where("account_id =  ?", account) if account.present?
     
      query
        
       
    end

    def set_status
      unless self.status.present?
        self.paid = "Confirmé"
      end
    end
end
