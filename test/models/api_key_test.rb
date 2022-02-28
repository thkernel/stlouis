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

require 'test_helper'

class ApiKeyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
