class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :uid
      t.string :company_name
      t.string :first_name
      t.string :last_name
      t.string :civility
      t.string :address
      t.string :country
      t.string :city
      t.string :phone
      t.string :street
      t.string :po_box
      t.string :zip_code
      t.string :email
      t.string :description
      t.string :status
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
