class Message < ApplicationRecord
  has_many :refers
  validates :text,presence: true
end
