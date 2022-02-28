class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.string :uid
      t.references :cart, foreign_key: true
      t.references :food, foreign_key: true
      t.references :product, foreign_key: true
      t.float :quantity, default: 0.0
      t.string :status

      t.timestamps
    end
  end
end
