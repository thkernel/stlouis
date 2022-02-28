# == Schema Information
#
# Table name: profiles
#
#  id           :bigint           not null, primary key
#  role         :string
#  profile_type :string
#  first_name   :string
#  last_name    :string
#  civility     :string
#  address      :string
#  phone        :string
#  country_id   :bigint
#  locality_id  :bigint
#  description  :text
#  speciality   :string
#  views        :bigint           default(0)
#  status       :string
#  user_id      :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ProfileSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers

    attributes :id, :first_name, :last_name, :user_id, :avatar_url

    belongs_to :user
   

    def avatar_url
        rails_blob_url(object.avatar) if object.avatar.attachment
    end
 end
