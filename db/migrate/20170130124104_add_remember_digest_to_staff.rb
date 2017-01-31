class AddRememberDigestToStaff < ActiveRecord::Migration[5.0]
  def change
    add_column :staffs, :remember_digest, :string
  end
end
