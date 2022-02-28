# == Schema Information
#
# Table name: features
#
#  id            :bigint           not null, primary key
#  uid           :string
#  name          :string
#  subject_class :string
#  description   :string
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Feature < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid

validates :name,   uniqueness: true
	# Change default params ID to uid
  def to_param
    uid
  end

end
