module InvoicesHelper

	def unpaid?(invoice)
        if invoice.present? && invoice.paid == "Impayée"
            true
        else
            false
        end
    end
    

    def canceled?(invoice)
        if invoice.present? && invoice.status == "Annulée"
            true
        else
            false
        end
    end


    # Payment
    def payment?(fidelity_card, invoice)
		card = Card.find(fidelity_card.id)

		if card.present? && card.status == "Active"
			if card.balance < invoice.total
				 false
			else
				current_balance = card.balance - invoice.total
				card.update_column(:balance, current_balance);
				invoice.update_column(:paid, "Payée")
				invoice.update_column(:payment_method, "Carte de fidélité")
				invoice.update_column(:status, "Validée");

				true
			end
		else
			false

		end
	end



end
