class Staff < ApplicationRecord
  has_many :places
  belongs_to :refer
end
