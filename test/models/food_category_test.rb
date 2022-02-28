# == Schema Information
#
# Table name: food_categories
#
#  id          :bigint           not null, primary key
#  uid         :string
#  name        :string
#  description :text
#  status      :string
#  account_id  :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class FoodCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
