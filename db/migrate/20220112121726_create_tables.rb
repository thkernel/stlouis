class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.string :uid
      t.string :name
      t.string :status
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
