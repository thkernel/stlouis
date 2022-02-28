class CreateTechnicalSheetItems < ActiveRecord::Migration[5.2]
  def change
    create_table :technical_sheet_items do |t|
      t.string :uid
      t.references :technical_sheet, foreign_key: true
      t.references :product, foreign_key: true
      t.references :unity, foreign_key: true
      t.float :unity_purchase_cost_excl_tax, default: 0.0
      t.float :quantity, default: 0.0
      t.float :cost_price_excl_tax, default: 0.0

      t.timestamps
    end
  end
end
