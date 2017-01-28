class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :f_name,limit:25,null:false
      t.string :l_name,limit:35,null:false
      t.string :father_name,limit:25,null:false
      t.string :meli_code,limit:20,null:false
      t.string :major_name,limit:40,null:false
      t.string :city,limit:35,null:false
      t.string :maghta,limit:18,null:false
      t.string :student_code,limit:14,null:false
      t.date :input_date_univercity
      t.timestamp :last_login_date,null:true
      t.timestamps
    end
  end
end
