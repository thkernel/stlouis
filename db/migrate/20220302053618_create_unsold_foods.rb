class CreateUnsoldFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :unsold_foods do |t|
      t.string :uid
      t.references :food, foreign_key: true
      t.float :quantity, default: 0.0
      t.string :status
      t.text :description
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
