# == Schema Information
#
# Table name: roles
#
#  id          :bigint           not null, primary key
#  uid         :string
#  name        :string
#  description :text
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
