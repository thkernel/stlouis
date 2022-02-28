class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :first_name
      t.string :last_name
      t.string :sex
      #t.references :role, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
