class Request < ApplicationRecord
  has_many :features
  has_many :students

end
