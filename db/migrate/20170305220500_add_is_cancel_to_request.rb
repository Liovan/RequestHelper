class AddIsCancelToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests,:is_cancel,:boolean
  end
end
