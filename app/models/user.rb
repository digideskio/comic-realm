class User < ActiveRecord::Base
	include ActiveModel::SecurePassword

	VALID_EMAIL_REGEX    = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	VALID_USERNAME_REGEX = /\w+/i

	has_many :projects, :foreign_key => 'owner_id'
	has_many :notebooks, through: :projects
	has_many :documents, through: :notebooks

	has_secure_password
	validates_confirmation_of :password, if: lambda { |m| m.password.present? }

	validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
	validates :password, presence: true, length: { in: 8..32 }
	validates :username, presence: true, uniqueness: true, length: { in: 4..24 }, format: { with: VALID_USERNAME_REGEX }

	before_save { 
		email.downcase!
	}

	def self.authenticate(username, password)
		user = nil
		user = username.include?('@') ? User.find_by(email: username) : User.find_by(username: username)
		user.nil? ? false : user.authenticate(password)
	end

	def profile_link
		return '/profile/' + self.username.gsub(' ', '_')
	end

end
