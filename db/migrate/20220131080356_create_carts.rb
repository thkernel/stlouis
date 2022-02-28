class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.string :uid
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
