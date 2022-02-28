# == Schema Information
#
# Table name: providers
#
#  id           :bigint           not null, primary key
#  uid          :string
#  company_name :string
#  first_name   :string
#  last_name    :string
#  civility     :string
#  address      :string
#  country      :string
#  city         :string
#  phone        :string
#  street       :string
#  po_box       :string
#  zip_code     :string
#  description  :string
#  status       :string
#  account_id   :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class ProviderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
