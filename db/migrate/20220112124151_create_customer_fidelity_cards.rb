class CreateCustomerFidelityCards < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_fidelity_cards do |t|
      t.string :uid
      t.references :customer, foreign_key: true
      t.references :fidelity_card, foreign_key: true
      t.string :status
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
