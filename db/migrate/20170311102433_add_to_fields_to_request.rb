class AddToFieldsToRequest < ActiveRecord::Migration[5.0]
  def change
    remove_column :requests,:is_cancel
    add_column :requests,:status,:integer
    add_column :requests,:module_pointer,:integer
  end
end
