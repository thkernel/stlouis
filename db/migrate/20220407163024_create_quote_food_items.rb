class CreateQuoteFoodItems < ActiveRecord::Migration[5.2]
  def change
    create_table :quote_food_items do |t|
      t.string :uid
      t.references :quote, foreign_key: true
      t.references :food, foreign_key: true
      t.float :quantity, default: 0.0
      t.float :price, default: 0.0
      t.float :amount, default: 0.0
      t.string :status

      t.timestamps
    end
  end
end
