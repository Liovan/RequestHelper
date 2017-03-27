class Request < ApplicationRecord
  belongs_to :feature
  belongs_to :student
  has_many :needs,through: :result_students
  has_many :result_students
  scope :place_related ,lambda { |place| where(module_pointer:place,status:1) } # module_pointer points to requests 'stage' which is related to different Places  
end
