# == Schema Information
#
# Table name: fidelity_cards
#
#  id         :bigint           not null, primary key
#  uid        :string
#  balance    :float            default(0.0)
#  status     :string
#  account_id :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FidelityCardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
