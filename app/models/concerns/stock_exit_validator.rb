module StockExitValidator
    class StockReduceValidator < ActiveModel::Validator
  
        def validate(record)

            
            #puts "IMPUTABLE TYPE: #{record.imputable_type}"

            if record.new_record?
                puts "ON VALIDATOR"
                puts "RECORD: #{record.inspect}"
                if record.product_id.present?

                    puts "PRODUCT PRESENT"

                    product = Product.find(record.product_id)
                    quantity = record.quantity.to_f

                    #product_unity = product.unity.name.downcase

                    #puts "UNITY: #{product_unity.inspect}"
                    #if product_unity == "boule"
                        #quantity = quantity * 2.5
                    #end

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
                            record.errors.add(:stock_exit,"Le stock est insuffisant.")
                        end

                        
                    end
                end
            end
    
            #puts "RECORD: #{record.imputation_items.inspect}"
        end
      
    end


    
end