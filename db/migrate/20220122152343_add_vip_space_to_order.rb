class AddVipSpaceToOrder < ActiveRecord::Migration[5.2]
  def change
    change_table :orders do |t|
      t.boolean :vip_space, default: false
    end
   end
end
