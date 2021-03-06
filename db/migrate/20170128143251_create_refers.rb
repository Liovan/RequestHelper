class CreateRefers < ActiveRecord::Migration[5.0]
  def change
    create_table :refers do |t|
      t.belongs_to :staff,foreign_key: true
      t.references :message
      t.references :request,foreign_key: true
      t.integer :status_request,null:false
      t.timestamps
    end
  end
end
