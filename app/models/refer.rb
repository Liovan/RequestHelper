class Refer < ApplicationRecord
  has_many :staffs
  belongs_to :message
  belongs_to :request
end
