class User < ActiveRecord::Base
	include ActiveModel::SecurePassword

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	has_secure_password
	validates_confirmation_of :password, if: lambda { |m| m.password.present? }

	validate :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
	validate :password, presence: true, length: { in: 8..32 }
	validate :username, presence: true, uniqueness: true, length: { in: 4..24 }

	before_save { 
		self.email = email.downcase
	}

end
