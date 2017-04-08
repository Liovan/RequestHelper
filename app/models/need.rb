class Need < ApplicationRecord
  has_many :features
  has_many :requests,through: :result_students
  has_many :result_students
  VALID_FARSI_REGEX = /\A[اآبپتثئجچحخدذرزژسشصضطظعغفقکگلمنوهیءأؤّ\s]+\z/
  validates :name, presence: {message: "نام نمی تواند خالی باشد."},
                   length: {within: 2..45, too_long: "نام می تواند حداکثر 45 نویسه باشد.", too_short: "نام باید حداقل 2 نویسه باشد." },
                   format: {with: VALID_FARSI_REGEX, message: "نام باید فارسی باشد."}
end
