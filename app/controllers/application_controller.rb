class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_action :require_login, :except => [:not_authorized]

	def current_user
		@_current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
	end

	def logged_in?
		@_logged_in ||= !current_user.nil?
	end

	protected
	def not_authorized
		redirect_to root_url, :alert => "Login requis."
	end

	private
	def require_login
		unless logged_in?
			flash[:error] = "You must be logged in to access this section"
			not_authorized
		end
	end

end
