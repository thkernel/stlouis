# == Schema Information
#
# Table name: partners
#
#  id           :bigint           not null, primary key
#  uid          :string
#  company_name :string
#  first_name   :string
#  last_name    :string
#  civility     :string
#  address      :string
#  city         :string
#  country      :string
#  phone        :string
#  email        :string
#  description  :text
#  status       :string
#  account_id   :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class PartnerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
