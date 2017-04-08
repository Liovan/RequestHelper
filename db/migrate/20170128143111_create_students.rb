class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :f_name,limit:25,null:false
      t.string :l_name,limit:35,null:false
      t.string :father_name,limit:25,null:false
      t.string :meli_code,limit:20,null:false
      #t.string :major_name,limit:40,null:false
      t.string :city,limit:35,null:false
      t.integer :field, null:false
      t.string :student_code,limit:14,null:false
      t.date :entrance_date
      t.timestamp :last_login_date,null:true
      t.timestamps
    end
    add_index :students, :student_code, unique: true
    add_index :students, :field
    add_index :students, :meli_code, unique: true
  end
end
