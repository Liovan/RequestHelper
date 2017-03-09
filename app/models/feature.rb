class Feature < ApplicationRecord
  has_and_belongs_to_many :places
  has_many :requests
  has_many :needs
  validates :name,presence: true,length: {in:1..45,message: "can't be nil"}
end
