class CreateNeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :needs do |t|
      t.string :name
      t.integer :input_type,limit:2
      t.references :feature, foreign_key: true
    end
  end
end
