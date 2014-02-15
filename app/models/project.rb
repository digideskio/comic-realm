class Project < ActiveRecord::Base
	belongs_to :owner, :class_name => 'User'

	has_many :notebooks
	has_many :documents, through: :notebooks

	validate :title, presence: true, uniqueness: true
	validate :description, presence: true
end
