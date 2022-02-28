# == Schema Information
#
# Table name: tables
#
#  id         :bigint           not null, primary key
#  uid        :string
#  name       :string
#  status     :string
#  account_id :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TableTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
