# == Schema Information
#
# Table name: customer_fidelity_cards
#
#  id               :bigint           not null, primary key
#  uid              :string
#  customer_id      :bigint
#  fidelity_card_id :bigint
#  status           :string
#  account_id       :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class CustomerFidelityCardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
