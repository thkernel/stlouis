class CreateUnities < ActiveRecord::Migration[5.2]
  def change
    create_table :unities do |t|
      t.string :uid
      t.string :name
      t.string :unity_symbol
      t.text :decription
      t.string :status
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
