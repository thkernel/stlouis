# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  uid        :string
#  account_id :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
    belongs_to :user, optional: true
    has_many :cart_items, dependent: :destroy

    def add_product(cart_item)
      
       
        current_item = CartItem.where("product_id = ? AND cart_id = ?",  cart_item.product_id, self.id).take
        
        if current_item.present?
           
            current_item.quantity += cart_item.quantity.to_i
            current_item.save
            
        else
           
            new_item = CartItem.create(product_id: cart_item.product_id, quantity: cart_item.quantity, cart_id: self.id, )
            
        end
        new_item
    end

    def add_food(cart_item)
      
       
        current_item = CartItem.where("food_id = ? AND cart_id = ?",  cart_item.food_id, self.id).take
        
        if current_item.present?
           
            current_item.quantity += cart_item.quantity.to_i
            current_item.save
            
        else
           
            new_item = CartItem.create(food_id: cart_item.food_id, quantity: cart_item.quantity, cart_id: self.id, )
            
        end
        new_item
    end

end
