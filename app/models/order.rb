# == Schema Information
#
# Table name: orders
#
#  id             :bigint           not null, primary key
#  uid            :string
#  customer_id    :bigint
#  table_id       :bigint
#  subtotal       :float            default(0.0)
#  total          :float            default(0.0)
#  tax            :float            default(0.0)
#  shipping       :float            default(0.0)
#  status         :string
#  paid           :string
#  payment_method :string
#  account_id     :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  vip_space      :boolean          default(FALSE)
#  social_case    :boolean          default(FALSE)
#

class Order < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid, :set_total, :set_status, :set_payment_status

  belongs_to :customer
  belongs_to :account
  belongs_to :table, optional: :true
  

  has_many :order_items, dependent: :destroy
  has_many :order_item_drinks, dependent: :destroy

  validates_with OrderItemDrinksValidator::OrderItemDrinksValidator
  validates_with OrderItemsValidator::OrderItemsValidator
  validates_with CustomerSocialCaseValidator::CustomerSocialCaseValidator

  accepts_nested_attributes_for :order_items ,  allow_destroy: true , :reject_if => :no_order_items
  accepts_nested_attributes_for :order_item_drinks ,  allow_destroy: true , :reject_if => :no_order_item_drinks

  #scope :day, -> (start_date) {where("DATE(start_date) = ?", start_date)}
	# Change default params ID to uid
  def to_param
    uid
  end

  def no_order_items(attributes)
   if Apartment::Tenant.current == "shop"
    
    attributes[:product_id].blank?
  else
    attributes[:food_id].blank?

    end
  end

  def no_order_item_drinks(attributes)
   if Apartment::Tenant.current == "shop"
    
    attributes[:product_id].blank?
 

    end
  end



  def order_item_subtotal
   
      order_items.collect {|order_item| order_item.valid? ? (order_item.price*order_item.quantity) : 0}.sum 
    

  end

  def order_item_drink_subtotal
    
      order_item_drinks.collect {|order_item| order_item.valid? ? (order_item.unit_price*order_item.quantity) : 0}.sum 
    

  end

  # Search
    def self.search(start_date, end_date,  account)
        
        
      query = Order.order(:created_at)
      query = query.where("DATE(created_at) BETWEEN ? AND ? ", start_date, end_date) if start_date.present? and  end_date.present?
      query = query.where("account_id =  ?", account) if account.present?
     
      query
        
       
    end

  private
    def set_total
      puts "SUBTOTAL: #{subtotal}"
      if self.vip_space == true
        self[:subtotal] = order_item_subtotal + order_item_drink_subtotal + 1000
        self[:total] = order_item_subtotal + order_item_drink_subtotal + 1000
      else
        self[:subtotal] = order_item_subtotal + order_item_drink_subtotal 
        self[:total] = order_item_subtotal + order_item_drink_subtotal 
      end
    end

    def set_status
      unless self.status.present?
        self.status = "En attente"
      end

      
    end

    def set_payment_status
      unless self.paid.present?
        self.paid = "Impayée"
      end
    end
    
  
  
end
