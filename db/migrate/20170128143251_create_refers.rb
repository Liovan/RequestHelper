class CreateRefers < ActiveRecord::Migration[5.0]
  def change
    create_table :refers do |t|
      t.belongs_to :staff,index:true
      t.belongs_to :message,index:true
      t.belongs_to :request,index:true
      t.integer :status_request,null:false
      t.timestamps
    end
  end
end
