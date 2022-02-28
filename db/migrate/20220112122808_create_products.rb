class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :uid
      t.string :slug
      t.references :product_category, foreign_key: true
      t.string :name
      t.references :unity, foreign_key: true
      t.string :bar_code
      t.float :unit_price
      t.references :provider, foreign_key: true
      t.float :reorder_threshold
      t.float :current_stock, default: 0.0
      t.string :description
      t.references :account, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
