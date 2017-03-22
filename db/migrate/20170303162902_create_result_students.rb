class CreateResultStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :result_students do |t|
      t.belongs_to :request, foreign_key: true
      t.belongs_to :need, foreign_key: true
      t.string :value , limit:255,null:false
      t.timestamps
    end
  end
end
