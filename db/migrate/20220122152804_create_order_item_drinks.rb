class CreateOrderItemDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :order_item_drinks do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.float :quantity
      t.float :unit_price
      t.float :amount

      t.timestamps
    end
  end
end
