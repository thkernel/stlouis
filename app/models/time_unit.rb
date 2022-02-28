# == Schema Information
#
# Table name: time_units
#
#  id          :bigint           not null, primary key
#  uid         :string
#  name        :string
#  description :string
#  status      :string
#  account_id  :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class TimeUnit < ApplicationRecord
  belongs_to :account
end
