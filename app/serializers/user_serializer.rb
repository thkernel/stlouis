# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  uid        :string
#  first_name :string
#  last_name  :string
#  sex        :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserSerializer < ActiveModel::Serializer
  attributes :id,:uid, :login, :slug ,  :role_id, :email, :full_name, :avatar_url 
  
  belongs_to :role
  has_one  :profile, dependent: :destroy
  has_many :poll_categories, dependent: :destroy
  has_many :polls, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votings, dependent: :destroy

 
def full_name
	"#{object.profile.first_name} #{object.profile.last_name}" 
end

def avatar_url
        rails_blob_url(object.profile.avatar) if object.profile.avatar.attachment
  end
 
end
