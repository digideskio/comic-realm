class Notebook < ActiveRecord::Base
	belongs_to :project

	validate :title, presence: true, uniqueness: true
	validate :description, presence: true
end
