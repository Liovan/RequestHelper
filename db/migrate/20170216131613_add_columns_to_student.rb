class AddColumnsToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :password_digest, :string
    add_column :students, :remember_digest, :string
  end
end
