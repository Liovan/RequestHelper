class CreateStaffs < ActiveRecord::Migration[5.0]
  def change
    create_table :staffs do |t|
      t.string :f_name,limit:25,null:false
      t.string :l_name,limit:30,null:false
      t.references :place
      t.timestamps
    end
  end
end
