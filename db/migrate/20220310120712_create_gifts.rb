class CreateGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :gifts do |t|
      t.string :uid
      t.references :customer, foreign_key: true
      t.float :food_quantity
      t.float :bonus_number
      t.string :status

      t.timestamps
    end
  end
end
