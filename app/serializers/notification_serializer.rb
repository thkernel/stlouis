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

class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :uid
end