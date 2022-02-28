module OrdersHelper

	def unpaid?(order)
        if order.present? && order.paid == "Impayée"
            true
        else
            false
        end
    end
    

    def canceled?(order)
        if order.present? && order.status == "Annulée"
            true
        else
            false
        end
    end


    # Payment
    def payment?(fidelity_card, order)
		card = Card.find(fidelity_card.id)

		if card.present? && card.status == "Active"
			if card.balance < order.total
				 false
			else
				current_balance = card.balance - order.total
				card.update_column(:balance, current_balance);
				order.update_column(:paid, "Payée")
				order.update_column(:payment_method, "Carte de fidélité")
				order.update_column(:status, "Validée");

				true
			end
		else
			false

		end
	end


    
end
