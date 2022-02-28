module OrderItemsValidator
    class OrderItemsValidator < ActiveModel::Validator
  
        def validate(record)

            
            #puts "IMPUTABLE TYPE: #{record.imputable_type}"

            if record.new_record?
                puts "ON VALIDATOR"
                puts "RECORD: #{record.inspect}"
                #order_items = record.order_items
                order_items = record.order_items

                #puts "ORDER ITEMS: #{order_items.inspect}"
                puts "ORDER ITEM : #{order_items.inspect}"

                order_items.each do |order_item|

                    if order_item.product_id.present?
                        product = Product.find(order_item.product_id)
                        quantity = order_item.quantity.to_f

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
                
                
            end
    
            #puts "RECORD: #{record.imputation_items.inspect}"
        end
      
    end
end