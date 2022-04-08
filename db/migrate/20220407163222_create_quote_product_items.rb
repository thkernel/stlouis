class CreateQuoteProductItems < ActiveRecord::Migration[5.2]
  def change
    create_table :quote_product_items do |t|
      t.string :uid
      t.references :quote, foreign_key: true
      t.references :product, foreign_key: true
      t.float :quantity, default: 0.0
      t.float :unit_price, default: 0.0
      t.float :amount, default: 0.0
      t.string :status

      t.timestamps
      
    end
  end
end
