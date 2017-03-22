class Request < ApplicationRecord
  belongs_to :feature
  belongs_to :student
  has_many :needs,through: :result_students
  has_many :result_students
  scope :find_module_pointer,lambda {|place| where(module_pointer:place,status:1)}
end
