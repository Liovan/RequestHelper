class AddColumnUsenameToStaff < ActiveRecord::Migration[5.0]
  def change
    add_column :staffs,:username,:string,unique: true,null: false
  end
end
