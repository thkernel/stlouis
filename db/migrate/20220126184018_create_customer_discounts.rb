class CreateCustomerDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_discounts do |t|
      t.string :uid
      t.references :customer, foreign_key: true
      t.float :amount
      t.string :status
      t.references :account, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
