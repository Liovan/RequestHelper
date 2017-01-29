class Feature < ApplicationRecord
  has_and_belongs_to_many :places
  belongs_to :request
  validates :name,presence: true,length: {in:1..45,message: "can't be nil"}
end
