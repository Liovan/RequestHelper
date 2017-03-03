class Need < ApplicationRecord
  belongs_to :feature
  has_many :result_students
end
