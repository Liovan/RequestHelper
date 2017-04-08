class AddIndexToStaffsUsername < ActiveRecord::Migration[5.0]
  def change
  	add_index :staffs, :username, unique: true
  end
end
