class AddForeignKeyFeatureAndMessage < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :requests,:features
    add_foreign_key :refers,:messages
  end
end
