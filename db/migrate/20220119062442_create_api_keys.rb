class CreateApiKeys < ActiveRecord::Migration[5.2]
  def change
    create_table :api_keys do |t|
      t.string :access_token
      t.references :account, foreign_key: true
      t.datetime :expires_at
      t.boolean :active

      t.timestamps
    end
  end
end
