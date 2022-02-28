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

require 'test_helper'

class SmtpServerSettingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
