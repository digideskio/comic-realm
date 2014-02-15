class Project < ActiveRecord::Base
	belongs_to :user
	has_many :notebook

	validate :title, presence: true, uniqueness: true
	validate :description, presence: true
end
