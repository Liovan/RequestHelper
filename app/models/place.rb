class Place < ApplicationRecord
  has_many :staffs
  VALID_FARSI_REGEX = /\A[اآبپتثئجچحخدذرزژسشصضطظعغفقکگلمنوهیءأؤّ\s]+\z/
  validates :name, presence: {message: "نام نمی تواند خالی باشد."},
                   length: {within: 2..45, too_long: "نام می تواند حداکثر 45 نویسه باشد.", too_short: "نام باید حداقل 2 نویسه باشد." },
                   uniqueness: {message: "این نام قبلاً استفاده شده است."},
                   format: {with: VALID_FARSI_REGEX, message: "نام باید فارسی باشد."}

end
