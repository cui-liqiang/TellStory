class ApplicationController < ActionController::Base
	protect_from_forgery

  def callback
		"www.tellstoryto.us"
  end

  def redirect_to_callback_url
    redirect_to session[:redirect_to] || "/"
    session[:redirect_to] = nil
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

  def login_validate
    redirect_to "/" unless session[:logged_in]
  end

  def login user
    session[:user] = user
    session[:logged_in] = true
  end

  def logout user
    session[:logged_in] = false
    session[:user] = nil
  end
end
