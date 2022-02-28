# == Schema Information
#
# Table name: public.tenants
#
#  id                :bigint           not null, primary key
#  uid               :string
#  organization_name :string
#  address           :string
#  phone             :string
#  country           :string
#  city              :string
#  email             :string
#  website           :string
#  subdomain         :string
#  status            :string
#  account_id        :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class TenantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
