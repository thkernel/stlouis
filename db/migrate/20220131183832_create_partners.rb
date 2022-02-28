class CreatePartners < ActiveRecord::Migration[5.2]
  def change
    create_table :partners do |t|
      t.string :uid
      t.string :company_name
      t.string :first_name
      t.string :last_name
      t.string :civility
      t.string :address
      t.string :city
      t.string :country
      t.string :phone
      t.string :email
      t.text :description
      t.string :status
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
