module OrderItemDrinksValidator
    class OrderItemDrinksValidator < ActiveModel::Validator
  
        def validate(record)

            
            #puts "IMPUTABLE TYPE: #{record.imputable_type}"

            if record.new_record?
                puts "ON VALIDATOR"
                puts "RECORD: #{record.inspect}"
                #order_items = record.order_items
                order_item_drinks = record.order_item_drinks

                #puts "ORDER ITEMS: #{order_items.inspect}"
                puts "ORDER ITEM DRINKS: #{order_item_drinks.inspect}"

                order_item_drinks.each do |order_item_drink|


                    product = Product.find(order_item_drink.product_id)
                    quantity = order_item_drink.quantity.to_f

                    puts "PRODUCT FOUND: #{product.inspect}"

                    if product.present? && quantity > 0.0  
                        
                        puts "Product current stock: #{product.current_stock}"
                        if product.current_stock.present? && product.current_stock >= quantity
                            puts "STOCK AVAILABLE"
                            current_stock = product.current_stock - quantity
                            puts "CURRENT STOCK: #{current_stock}"
                            product.update_column(:current_stock, current_stock);
                        else
                            puts "ELSE CASE"
                            record.errors.add(:product,": #{product.name} insuffisant dans le stock")
                        end 
                    end
                
                end
                
                
            end
    
            #puts "RECORD: #{record.imputation_items.inspect}"
        end
      
    end
end