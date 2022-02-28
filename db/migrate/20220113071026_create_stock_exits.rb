class CreateStockExits < ActiveRecord::Migration[5.2]
  def change
    create_table :stock_exits do |t|
      t.string :uid
      t.references :product, foreign_key: true
      t.string :reason
      t.float :quantity, default: 0.0
      t.references :unity, foreign_key: true
      t.text :description
      t.string :status
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
