class ChangeLastLoginForStaffAndStudent < ActiveRecord::Migration[5.0]
  def change
    rename_column :staffs,:last_login,:last_login_date
  end
end
