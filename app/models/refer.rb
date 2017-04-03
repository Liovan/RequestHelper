class Refer < ApplicationRecord
  has_many :staffs
  belongs_to :message
  has_many :requests
end
