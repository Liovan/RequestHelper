class CreateTemps < ActiveRecord::Migration[5.0]
  def change
    create_table :temps do |t|
      t.string :f_name
      t.string :l_name
      t.string :father_name
      t.string :meli_code
      t.string :city
      t.integer :field
      t.string :student_code
      t.string :password_digest,lenght:255
    end
  end
end
