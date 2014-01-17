class HomeController < ApplicationController
	skip_before_filter :require_login, :only => [:index]

	def index
		@logged_in = logged_in?
	end

end
