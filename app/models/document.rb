class Document < ActiveRecord::Base
	belongs_to :notebook
	belongs_to :owner, :class_name => 'User'
end
