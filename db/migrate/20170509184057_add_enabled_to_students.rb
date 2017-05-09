class AddEnabledToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students,:enabled,:boolean,default:true
  end
end
