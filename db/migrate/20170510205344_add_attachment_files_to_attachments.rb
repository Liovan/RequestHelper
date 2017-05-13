class AddAttachmentFilesToAttachments < ActiveRecord::Migration
  def self.up
    change_table :attachments do |t|
      t.attachment :files
    end
  end

  def self.down
    remove_attachment :attachments, :files
  end
end
