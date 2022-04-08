class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :uid
      t.references :customer, foreign_key: true
      t.references :quote, foreign_key: true
      t.float :subtotal, default: 0.0
      t.float :total , default: 0.0
      t.float :tax , default: 0.0
      t.float :shipping, default: 0.0
      t.string :status
      t.string :paid
      t.string :payment_method
      t.references :account, foreign_key: true
      t.string :status

      t.timestamps
      
    end
  end
end
