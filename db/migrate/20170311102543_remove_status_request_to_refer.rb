class RemoveStatusRequestToRefer < ActiveRecord::Migration[5.0]
  def change
    remove_column :refers,:status_request
  end
end
