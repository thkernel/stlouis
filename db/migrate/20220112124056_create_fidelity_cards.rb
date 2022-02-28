class CreateFidelityCards < ActiveRecord::Migration[5.2]
  def change
    create_table :fidelity_cards do |t|
      t.string :uid
      t.float :balance, default: 0.0
      t.string :status
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
