class AddRememberTokenToStaff < ActiveRecord::Migration[5.0]
  def change
    add_column :staffs, :remember_digest, :string, limit: 255
  end
end
