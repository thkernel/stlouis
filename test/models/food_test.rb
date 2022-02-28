# == Schema Information
#
# Table name: foods
#
#  id               :bigint           not null, primary key
#  uid              :string
#  slug             :string
#  food_category_id :bigint
#  name             :string
#  min_cooking_time :time
#  max_cooking_time :time
#  price            :float
#  descriptions     :string
#  status           :string
#  account_id       :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class FoodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
