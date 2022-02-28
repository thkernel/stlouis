# == Schema Information
#
# Table name: notifications
#
#  id               :bigint           not null, primary key
#  uid              :string
#  nature           :string
#  recipient_id     :bigint
#  content          :text
#  status           :string
#  readed_at        :datetime
#  notificable_type :string
#  notificable_id   :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Notification < ApplicationRecord
		# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid

	belongs_to :notificable, polymorphic: true

  	belongs_to :account, :foreign_key => "recipient_id", :class_name => "Account"


end
