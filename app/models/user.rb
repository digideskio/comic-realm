class User < ActiveRecord::Base
	include ActiveModel::SecurePassword

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

	has_many :projects

	has_secure_password
	validates_confirmation_of :password, if: lambda { |m| m.password.present? }

	validate :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
	validate :password, presence: true, length: { in: 8..32 }
	validate :username, presence: true, uniqueness: true, length: { in: 4..24 }

	before_save { 
		email.downcase!
	}

	def self.authenticate(username, password)
		user = nil
		user = username.include?('@') ? User.find_by(email: username) : User.find_by(username: username)
		user.nil? ? false : user.authenticate(password)
	end

end
