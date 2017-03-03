class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :student,foreign_key: true
      t.references :feature
      t.timestamps
    end
  end
end
