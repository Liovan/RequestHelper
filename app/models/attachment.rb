class Attachment < ApplicationRecord
  has_attached_file :files
  validates_attachment :files, presence: true
  validates_attachment_content_type  :files, content_type: ['text/plain', 'text/csv']
end
