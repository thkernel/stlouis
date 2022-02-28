class AddSocialCaseInOrder < ActiveRecord::Migration[5.2]
  def change
  	change_table :orders do |t|
      t.boolean :social_case, default: false
    end
  end
end
