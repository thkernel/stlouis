class CreateActivityLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_logs do |t|
      t.string :uid

      t.timestamps
    end
  end
end
