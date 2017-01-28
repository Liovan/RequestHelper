class AddColumnsToStaff < ActiveRecord::Migration[5.0]
  def change
    add_column :staffs, :last_login, :datetime
    add_column :staffs, :password_digest, :string,limit:255
  end
end
