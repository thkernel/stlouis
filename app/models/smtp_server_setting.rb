# == Schema Information
#
# Table name: smtp_server_settings
#
#  id                   :bigint           not null, primary key
#  uid                  :string
#  host_name            :string
#  user_name            :string
#  user_password        :string
#  domain               :string
#  port                 :integer
#  authentication       :string
#  enable_starttls_auto :boolean
#  ssl                  :boolean
#  account_id           :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class SmtpServerSetting < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  belongs_to :account


	# Change default params ID to uid
  def to_param
    uid
  end

  
end
