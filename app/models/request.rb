class Request < ApplicationRecord
  has_many :features
  belongs_to :student

end
