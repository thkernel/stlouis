class CreateCustomerSocialCases < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_social_cases do |t|
      t.string :uid
      t.references :customer, foreign_key: true
      t.integer :dish_number, default: 0
      t.references :time_unit, foreign_key: true
      t.string :status
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
