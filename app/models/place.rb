class Place < ApplicationRecord
  belongs_to :staff
  has_and_belongs_to_many :features
end
