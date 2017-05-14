class DeleteEntranceDateInStudent < ActiveRecord::Migration[5.0]
  def change
    remove_column :students,:entrance_date
  end
end
