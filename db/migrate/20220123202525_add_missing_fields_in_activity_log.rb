class AddMissingFieldsInActivityLog < ActiveRecord::Migration[5.2]
  def change
  	change_table :activity_logs do |t|
	  	t.references :account, foreign_key: true
		t.string :browser
		t.string :ip_address
		t.string :controller
		t.string :action
		t.string :params
		t.string :note
	end
  end
end
