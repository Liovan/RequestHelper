class Feature < ApplicationRecord
  belongs_to :request
  has_and_belongs_to_many :places
end
