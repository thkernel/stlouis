class CreateTimeUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :time_units do |t|
      t.string :uid
      t.string :name
      t.string :description
      t.string :status
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
