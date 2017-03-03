class ResultStudent < ApplicationRecord
  belongs_to :request
  belongs_to :need
end
