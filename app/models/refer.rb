class Refer < ApplicationRecord
  has_many :staffs
  has_many :messages
  has_many :requests
end
