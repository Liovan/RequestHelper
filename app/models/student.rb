class Student < ApplicationRecord
  has_many :requests
  attr_accessor :remember_token
  
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
  has_secure_password validation: false
  
  validates :password, length: { minimum: 6, message: "رمز عبور باید حداقل ۶ نویسه باشد." }

  VALID_MELI_CODE_REGEX = /\A[0-9]{10}\z/
  validates :meli_code, presence: {message: "کدملی نمی تواند خالی باشد."},
                        length: {maximum: 20, message:"کدملی می تواند حداکثر ۲۰ نویسه باشد."},
                        format: {with: VALID_MELI_CODE_REGEX, message: "کدملی نامعتبر است."},
                        uniqueness: {case_sensitive: false, message: "کدملی قبلا استفاده شده است."}
  validate :national_code
  validates :student_code, presence: {message: "شماره دانشجویی نمی تواند خالی باشد."},
                           length: {maximum: 14, message: "شماره دانشجویی می تواند حداکثر 14 نویسه باشد."},
                           uniqueness: {case_sensitive: false, message: "شماره دانشجویی قبلاً استفاده شده است."}
  #Returns the hash digest of the given string.
  #need for testing
  def Student.digest(string)
    #https://github.com/rails/rails/blob/master/activemodel/lib/active_model/secure_password.rb
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #Returns a random token.
  def Student.new_token
    SecureRandom.urlsafe_base64
  end

  #use like @current_user.remember
  def remember
    #remember_token is virtual attribute
    self.remember_token = Student.new_token
    update_attribute(:remember_digest, Student.digest(remember_token))
  end

  #Forgets a user
  def forget
    update_attribute(:remember_digest, nil)
  end

  #Returns true if  the given token matches the digest
  def authenticated?(remember_token)
    return false if remember_digest.nil? #Prevents error (bug fix)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  private
  def national_code
    return false unless meli_code.match(/^\d+$/)
    if meli_code.length>=8 && meli_code.length<10
      meli_code.prepend('00')
    end
    code=meli_code.reverse!
    temp=0
    length=code.length
    length.downto(2) do |i|
      temp+=code[i-1].to_i * i
    end
    devide=temp%11
    control_number=code[0].to_i
    unless devide<2 && control_number==devide || devide>=2 && control_number==11-devide
      errors.add :meli_code,"کد ملی نامعتبر میباشد"
    end
    code=meli_code.reverse!
  end
end
