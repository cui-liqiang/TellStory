class ApplicationController < ActionController::Base
  protect_from_forgery

	def callback
		"stormy-day-2454.herokuapp.com"
	end

	def app_key
		"859b88ec720d4b910351e9408bc5cec6"
	end

	def app_id
		"100266968"
	end

	def current_user
		session[:user]
	end
end
