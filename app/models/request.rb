class Request < ApplicationRecord
  has_many :features
  has_many :students
  belongs_to :refer
end
