class Temp < ApplicationRecord
  
  def self.sync_students
    sql_execute("UPDATE students SET enabled=false WHERE meli_code NOT IN (select meli_code from temps);")
    sql_execute("DELETE FROM temps WHERE meli_code IN (SELECT meli_code FROM students);")
    temp=self.all
    temp.each do |student_of_temp|
      student_of_temp.update_attributes(password_digest: BCrypt::Password.create(student_of_temp.password_digest))
    end
    sql_execute("INSERT INTO students (f_name,l_name,father_name,meli_code,city,field,student_code,created_at,updated_at)
              (SELECT f_name,l_name,father_name,meli_code,city,field,student_code,(SELECT CURRENT_TIMESTAMP),(SELECT CURRENT_TIMESTAMP)
              FROM temps);")
  end

  
  
  private
  def self.sql_execute(sql)
    results = ActiveRecord::Base.connection.execute(sql)
    if results.present? 
      return true
    else
      return false
    end
  end
end
