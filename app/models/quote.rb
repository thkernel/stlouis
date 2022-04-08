# == Schema Information
#
# Table name: quotes
#
#  id          :bigint           not null, primary key
#  uid         :string
#  customer_id :bigint
#  subtotal    :float            default(0.0)
#  total       :float            default(0.0)
#  tax         :float            default(0.0)
#  shipping    :float            default(0.0)
#  status      :string
#  account_id  :bigint
#

class Quote < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid, :set_total, :set_status
  

  belongs_to :customer
  belongs_to :account
  
  

  has_many :quote_food_items, dependent: :destroy
  has_many :quote_product_items, dependent: :destroy


  accepts_nested_attributes_for :quote_food_items ,  allow_destroy: true , :reject_if => :no_quote_food_items
  accepts_nested_attributes_for :quote_product_items ,  allow_destroy: true , :reject_if => :no_quote_product_items


	def to_param
	    uid
	 end


	 def no_quote_food_items(attributes)
   if Apartment::Tenant.current == "shop"
    
    attributes[:product_id].blank?
  else
    attributes[:food_id].blank?

    end
  end

  def no_quote_product_items(attributes)
   if Apartment::Tenant.current == "shop"
    attributes[:product_id].blank?
    end
  end



  def quote_food_item_subtotal
      quote_food_items.collect {|food_item| food_item.valid? ? (food_item.price*food_item.quantity) : 0}.sum 
  end

  def quote_product_item_subtotal
      quote_product_items.collect {|product_item| product_item.valid? ? (product_item.unit_price*product_item.quantity) : 0}.sum 
  end




	 private
    def set_total
      puts "SUBTOTAL: #{subtotal}"
      
        self[:subtotal] = quote_food_item_subtotal + quote_product_item_subtotal 
        self[:total] = quote_food_item_subtotal + quote_product_item_subtotal 
      
    end

    def set_status
      unless self.status.present?
        self.status = "En attente"
      end

      
    end
end
