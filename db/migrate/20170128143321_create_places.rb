class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name,limit:25,null:false
      t.timestamps
    end
  end
end
