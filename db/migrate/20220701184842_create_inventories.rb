class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.string :uid
      t.datetime :inventory_date
      t.references :product, foreign_key: true
      t.float :current_stock, default: 0.0
      t.float :real_stock, default: 0.0
      t.float :difference, default: 0.0
      t.text :description
      t.string :status
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
