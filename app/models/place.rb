class Place < ApplicationRecord
  has_and_belongs_to_many :features
  has_many :staffs
  validates :name ,presence: true

end
