# == Schema Information
#
# Table name: api_keys
#
#  id           :bigint           not null, primary key
#  access_token :string
#  account_id   :bigint
#  expires_at   :datetime
#  active       :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ApiKey < ApplicationRecord
  #attr_accessor :access_token, :expires_at, :user_id, :active, :application
  before_create :generate_access_token
  before_create :set_expiration
  belongs_to :account

  def expired?
    DateTime.now >= self.expires_at
  end

  private
  def generate_access_token
    puts "GENERATE ACCESS TOKEN"
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  
  end

  def set_expiration
    self.expires_at = DateTime.now+150
  end
  
end
