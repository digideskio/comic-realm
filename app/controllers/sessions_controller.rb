class SessionsController < ApplicationController
	skip_before_action :require_login, only: ['new', 'create']

	def create
		if user = User.authenticate(params[:username], params[:password])
			session[:current_user_id] = user.id
			redirect_to root_url , :notice => "Logged in!"
		else
			redirect_to root_url, :alert => "Email or password was invalid."
		end
	end

	def destroy
		@_current_user = session[:current_user_id] = nil
		redirect_to root_url, :notice => 'Logged out!'
	end

end
