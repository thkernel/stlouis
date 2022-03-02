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

require 'test_helper'

class UnsoldFoodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
