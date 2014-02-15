class Notebook < ActiveRecord::Base
	belongs_to :project
	belongs_to :owner, :class_name => 'User'

	has_many :documents

	validate :title, presence: true, uniqueness: true
	validate :description, presence: true
end
