# == Schema Information
#
# Table name: poll_items
#
#  id         :bigint           not null, primary key
#  slug       :string
#  uid        :string
#  poll_id    :bigint
#  title      :string
#  subtitle   :string
#  content    :text
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PollItemSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :uid, :title, :poll_id,  :subtitle, :content, :status, :image_url
  belongs_to :poll

  has_many :comments
  has_many :votings

  def image_url
    rails_blob_url(object.image) if object.image.attachment
  end
  
end
