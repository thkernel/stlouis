# == Schema Information
#
# Table name: product_categories
#
#  id          :bigint           not null, primary key
#  uid         :string
#  slug        :string
#  name        :string
#  description :string
#  account_id  :bigint
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ProductCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
