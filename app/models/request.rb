class Request < ApplicationRecord
  belongs_to :feature
  belongs_to :student
  has_many :needs,through: :result_students
  has_many :result_students
  scope :active_place_related ,lambda { |place| where(module_pointer:place,status:1) } # module_pointer points to requests 'stage' which is related to different Places
  scope :requests_student,lambda{|student| where(student_id:student).order(updated_at: :desc)}
  scope :find_by_array,lambda{|array| find(array)}
end
