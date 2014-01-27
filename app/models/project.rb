class Project < ActiveRecord::Base
	belongs_to :user

	validate :title, presence: true, uniqueness: true
	validate :description, presence: true
end
