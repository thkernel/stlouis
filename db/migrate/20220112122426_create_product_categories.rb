class CreateProductCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :product_categories do |t|
      t.string :uid
      t.string :slug
      t.string :name
      t.string :description
      t.references :account, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
