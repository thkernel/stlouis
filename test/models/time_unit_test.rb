# == Schema Information
#
# Table name: time_units
#
#  id          :bigint           not null, primary key
#  uid         :string
#  name        :string
#  description :string
#  status      :string
#  account_id  :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class TimeUnitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
