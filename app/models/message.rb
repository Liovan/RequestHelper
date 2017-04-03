class Message < ApplicationRecord
  belongs_to :refer
  validates :text,presence: true
end
