class Need < ApplicationRecord
  has_many :features
  has_many :result_students
end
