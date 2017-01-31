class Staff < ApplicationRecord
  belongs_to :place, optional: true
  attr_accessor :remember_token

  validates :f_name, presence: {message: "نام نمی تواند خالی باشد."}, length: { maximum: 50, message:"نام می تواند حداکثر ۵۰ نویسه باشد" }
  validates :l_name, presence: {message: "نام خانوادگی نمی تواند خالی باشد."}, length: { maximum: 50, message:"نام خانوادگی می تواند حداکثر ۵۰ نویسه باشد" }
  has_secure_password validation: false
  validates :password, length: { minimum: 6, message: "رمز عبور باید حداقل ۶ نویسه باشد." }
  validates :username, presence: {message: "نام کاربری نمی تواند خالی باشد."}, length: { within: 5..25, too_long:"نام کاربری باید حداقل 5 نویسه باشد.", too_short:"نام کاربری می تواند حداکثر 25 نویسه باشد." }, uniqueness: { case_sensitive: false, message: "نام کاربری قبلاْ استفاده شده است." }

  #Returns the hash digest of the given string.
	#need for testing
	def Staff.digest(string)
		#https://github.com/rails/rails/blob/master/activemodel/lib/active_model/secure_password.rb
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
																									BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	#Returns a random token.
	def Staff.new_token
		SecureRandom.urlsafe_base64
	end

	#use like @current_user.remember
	def remember
		#remember_token is virtual attribute
		self.remember_token = Staff.new_token
		update_attribute(:remember_digest, Staff.digest(remember_token))
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

end
