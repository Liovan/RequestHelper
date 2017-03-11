class AddForeignKeyStaffToPlace < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :staffs,:places
  end
end
