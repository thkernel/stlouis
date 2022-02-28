class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :uid
      t.string :slug
      t.references :food_category, foreign_key: true
      t.string :name
      t.time :min_cooking_time
      t.time :max_cooking_time
      t.float :price
      t.string :descriptions
      t.string :status
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
