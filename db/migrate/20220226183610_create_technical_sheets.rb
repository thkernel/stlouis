class CreateTechnicalSheets < ActiveRecord::Migration[5.2]
  def change
    create_table :technical_sheets do |t|
      t.string :uid
      t.references :food, foreign_key: true
      t.float :portion_number, default: 0.0
      t.float :sale_price_incl_vat, default: 0.0
      t.float :vat_rate, default: 0.0
      t.float :total_cost_price_excl_tax, default: 0.0
      t.float :produced_portion_unit_cost_price_excl_tax, default: 0.0
      t.float :unsold_average_percentage, default: 0.0
      t.float :sold_portion_unit_cost_price_excl_vat, default: 0.0
      t.float :selling_price_excl_tax, default: 0.0
      t.float :gross_margin, default: 0.0
      t.float :margin_rate, default: 0.0
      t.float :margin_coefficient, default: 0.0
      t.string :status
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
