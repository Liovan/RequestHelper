class Feature < ApplicationRecord
  has_many :requests
  has_many :needs
  validates :name,presence: true,length: {in:1..45,message: "can't be nil"}
end
