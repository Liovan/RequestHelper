class Attachment < ApplicationRecord
  has_attached_file :files
  validates_attachment :files, presence: true,
                       content_type: { content_type: "image/jpeg" }
end
