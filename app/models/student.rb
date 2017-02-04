class Student < ApplicationRecord
  has_many :requests

  VALID_FARSI_REGEX = /\A[اآبپتثئجچحخدذرزژسشصضطظعغفقکگلمنوهیءأؤّ\s]+\z/
  validates :f_name, presence: {message: "نام نمی تواند خالی باشد."},
                     length: { maximum: 25, message:"نام می تواند حداکثر ۲۵ نویسه باشد" },
                     format: {with: VALID_FARSI_REGEX, message: "نام باید فارسی باشد."}
  validates :l_name, presence: {message: "نام خانوادگی نمی تواند خالی باشد."},
                     length: { maximum: 35, message:"نام خانوادگی می تواند حداکثر ۳۵ نویسه باشد" },
                     format: {with: VALID_FARSI_REGEX, message: "نام خانوادگی باید فارسی باشد."}
  validates :father_name, presence: {message: "نام پدر نمی تواند خالی باشد."},
                          length: { maximum: 25, message:"نام پدر می تواند حداکثر ۲۵ نویسه باشد" },
                          format: {with: VALID_FARSI_REGEX, message: "نام پدر باید فارسی باشد."}
  VALID_MELI_CODE_REGEX = /\A[0-9]{10}\z/
  validates :meli_code, presence: {message: "کدملی نمی تواند خالی باشد."},
                        length: {maximum: 20, message:"کدملی می تواند حداکثر ۲۰ نویسه باشد."},
                        format: {with: VALID_MELI_CODE_REGEX, message: "کدملی نامعتبر است."},
                        uniqueness: {case_sensitive: false, message: "کدملی قبلا استفاده شده است."}
end
