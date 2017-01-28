class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.belongs_to :student,index:true
      t.belongs_to :feature,index:true
      t.timestamps
    end
  end
end
