class Request < ApplicationRecord
  belongs_to :feature
  belongs_to :student
  scope :find_module_pointer,lambda {|place| where(module_pointer:place,status:1)}
end
