module ApplicationHelper
	def logged_in
		session[:logged_in]
	end

	def user_name
		session[:user].display_name
	end	
end
