class CreateRechargeFidelityCards < ActiveRecord::Migration[5.2]
  def change
    create_table :recharge_fidelity_cards do |t|
      t.string :uid
      t.references :fidelity_card, foreign_key: true
      t.float :amount, default: 0.0
      t.string :status
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
