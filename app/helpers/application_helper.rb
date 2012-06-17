module ApplicationHelper
	def logged_in
		session[:logged_in]
	end

	def user_name
		session[:user].display_name
  end

  def folder_name clazz
    {
        Story => "stories",
        Follow => "follows",
        Comment => "comments"
    }[clazz]
  end

end
