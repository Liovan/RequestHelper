class Place < ApplicationRecord
  has_many :staffs
  validates :name ,presence: true

end
