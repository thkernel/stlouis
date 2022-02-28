# == Schema Information
#
# Table name: accounts
#
#  id                     :bigint           not null, primary key
#  uid                    :string
#  login                  :string
#  slug                   :string
#  role_id                :bigint           not null
#  status                 :string
#  accountable_type       :string
#  accountable_id         :bigint
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Account < ApplicationRecord
  include PgSearch::Model
  # Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # Relationships
   belongs_to :accountable, polymorphic: true, optional: true

   belongs_to :role

   has_many :food_categories, dependent: :destroy
   has_many :product_categories, dependent: :destroy
   has_many :foods, dependent: :destroy
   has_many :products, dependent: :destroy
   has_many :customers, dependent: :destroy
   has_many :providers, dependent: :destroy
   has_many :stock_entries, dependent: :destroy
   has_many :stock_exits, dependent: :destroy
   has_many :tables, dependent: :destroy
   has_many :fidelity_cards, dependent: :destroy
   has_many :customer_fidelity_cards, dependent: :destroy
   has_many :recharge_fidelity_cards, dependent: :destroy
   has_many :orders, dependent: :destroy
   has_many :tenants, dependent: :destroy
   has_many :customer_discounts, dependent: :destroy
   has_many :customer_social_cases, dependent: :destroy
   has_many :unities, dependent: :destroy
   has_many :time_units, dependent: :destroy
   has_many :partners, dependent: :destroy
   has_many :technical_sheets, dependent: :destroy


   has_many :recipient_notifications, :class_name => "Notification", :foreign_key => :recipient_id
   

  # Add nested attributes for profile.
  #accepts_nested_attributes_for :customer

   # Change default params ID to uid
  def to_param
    uid
  end


  def superuser?
    if self.role.name == "Superuser"
      true 
    else
      false
    end
  end
  
  def admin?
    if self.role.name == "Administrateur"
      true 
    else
      false
    end
  end

  def superviseur?
    if self.role.name == "Superviseur"
      true 
    else
      false
    end
  end

  def gerant?
    if self.role.name == "Gérant"
      true 
    else
      false
    end
  end
  
  def user?
    if self.role.name == "user"
      true 
    else
      false
    end
  end
  
  def guest?
    if self.role.name == "guest"
      true 
    else
      false
    end
  end

  def client?
    if self.role.name == "Client"
      true 
    else
      false
    end
  end
  
end
