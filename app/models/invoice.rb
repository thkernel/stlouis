# == Schema Information
#
# Table name: invoices
#
#  id             :bigint           not null, primary key
#  uid            :string
#  customer_id    :bigint
#  invoice_id       :bigint
#  subtotal       :float            default(0.0)
#  total          :float            default(0.0)
#  tax            :float            default(0.0)
#  shipping       :float            default(0.0)
#  status         :string
#  paid           :string
#  payment_method :string
#  account_id     :bigint
#

class Invoice < ApplicationRecord
	# Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid, :set_total, :set_status, :set_payment_status
  

  belongs_to :customer
  belongs_to :account
  belongs_to :quote, optional: true
  
  

  has_many :invoice_food_items, dependent: :destroy
  has_many :invoice_product_items, dependent: :destroy


  accepts_nested_attributes_for :invoice_food_items ,  allow_destroy: true , :reject_if => :no_invoice_food_items
  accepts_nested_attributes_for :invoice_product_items ,  allow_destroy: true , :reject_if => :no_invoice_product_items


	def to_param
	    uid
	 end


	 def no_invoice_food_items(attributes)
   if Apartment::Tenant.current == "shop"
    
    attributes[:product_id].blank?
  else
    attributes[:food_id].blank?

    end
  end

  def no_invoice_product_items(attributes)
   if Apartment::Tenant.current == "shop"
    attributes[:product_id].blank?
    end
  end



  def invoice_food_item_subtotal
      invoice_food_items.collect {|food_item| food_item.valid? ? (food_item.price*food_item.quantity) : 0}.sum 
  end

  def invoice_product_item_subtotal
      invoice_product_items.collect {|product_item| product_item.valid? ? (product_item.unit_price*product_item.quantity) : 0}.sum 
  end




	 private
    def set_total
      puts "SUBTOTAL: #{subtotal}"
      
        self[:subtotal] = invoice_food_item_subtotal + invoice_product_item_subtotal 
        self[:total] = invoice_food_item_subtotal + invoice_product_item_subtotal 
      
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
