class AddAttachmentAttachmentToTemps < ActiveRecord::Migration
  def self.up
    change_table :temps do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :temps, :attachment
  end
end
