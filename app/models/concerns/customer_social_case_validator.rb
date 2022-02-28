module CustomerSocialCaseValidator
    class CustomerSocialCaseValidator < ActiveModel::Validator
  
        def validate(record)

            
            #puts "IMPUTABLE TYPE: #{record.imputable_type}"

            if record.new_record?

                #Recuperer le client
                customer = Customer.find(record.customer_id)
                
                #Verifier son cas
                customer_social_case = CustomerSocialCase.find_by(customer_id: customer.id)
                
                #Si cas social
                if customer_social_case.present?
                    
                    
                    if record.order_items.present?
                        #Recuprer le nombre de plat par jour

                        #Recupere ces commandes du jour
                        puts "DATE DU JOUR: #{Date.today}"
                        current_date_orders = Order.where(customer_id: customer.id).where("DATE(created_at) = ?", Date.today )
                        puts "CURRENT DATE ORDERS: #{current_date_orders.inspect}"
                        current_date_order_dish_number = 0

                        if current_date_orders.present?
                            
                            current_date_order_items = OrderItem.where(order_id: current_date_orders.map(&:id))
                            puts "CURRENT DATE ORDER ITEMS: #{current_date_order_items.inspect}"
                            
                            current_date_order_dish_number = current_date_order_items.collect {|order_item| order_item.valid? ? (order_item.quantity) : 0}.sum 
                            current_date_order_dish_number = current_date_order_dish_number.to_i
                            puts "CURRENT DATE ORDER DISH NUMBER: #{current_date_order_dish_number}"
                            
                        end
                        
                        #order_items = record.order_items 
                        current_order_dish_number = record.order_items.collect {|order_item| order_item.valid? ? (order_item.quantity) : 0}.sum 
                        
                        current_order_dish_number = current_order_dish_number.to_i

                        puts "CURRENT ORDER DISH NUMBER: #{current_order_dish_number}"
                        
                        customer_social_case_dish_number = customer_social_case.dish_number.to_i

                         #Comparer
                        if current_date_order_dish_number  >= customer_social_case_dish_number  
                            #Si depasser message erreur avec motif
                           record.social_case = false
                            #record.errors.add(:order,": Le client, #{customer.customer_name} a dépassé(e) le nombre de plat offert dans le cadre social.")
                        elsif  current_order_dish_number > customer_social_case_dish_number  
                            record.errors.add(:order,": Le client, #{customer.customer_name} a dépassé(e) le nombre de plat offert dans le cadre social.")

                        else
                            record.social_case = true
                        end

                    end
                   
                   
                    
                end
                
                
              
            end
    
            #puts "RECORD: #{record.imputation_items.inspect}"
        end
      
    end
end