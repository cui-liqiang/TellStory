# encoding: utf-8
class SessionsController < ApplicationController
	include HTTParty

	base_uri 'https://graph.qq.com'

	def create
		#if(!session[:logged_in])
		#	login_with_qq
		#end
		#redirect_to '/'
    user = User.authenticate(params[:email], params[:password])
    if user.nil?
      @error_msg = "用户名或密码错"
    else
      if user.active
        login(user)
      else
        @error_msg = "用户尚未激活，请到#{user.email}去验证您的账户"
      end
    end
    if params[:ajax]
      render "sessions/pop_up_new", :layout => false, :status => auth_result_status(@error_msg)
    else
      render :new
    end
	end

  def auth_result_status error_msg
    error_msg.nil? ? 200 : 401
  end

  def new
    redirect_to "/" if session[:logged_in]
		#redirect_to "https://graph.qq.com/oauth2.0/authorize?response_type=code" +
		#		"&client_id=#{app_id}&redirect_uri=#{callback}&scope=get_info,add_t"
  end

  def destroy
    logout current_user
    redirect_to "/"
  end

  def login_with_qq
		code = params[:code]
		random = 'random'
		access_token_response = self.class.get("/oauth2.0/token?grant_type=authorization_code&client_id=100266968&" + 
					"client_secret=#{app_key}&code=#{code}&state=#{random}&redirect_uri=#{callback}")
		open_id_response = self.class.get("/oauth2.0/me?access_token=#{extract_access_token(access_token_response)}")
		extract_open_id(open_id_response)
		extract_user_info
		session[:logged_in] = true
	end

	def extract_user_info
		response = self.class.get("/user/get_info?access_token=#{session[:access]}&oauth_consumer_key=#{app_id}&openid=#{session[:open_id]}")
		user_info = JSON.parse(response.body)
		user = User.find_or_create_by_name(user_info["data"]["name"])
		user.display_name = user_info["data"]["nick"]
		user.head = user_info['data']['head']
		user.save
		session[:user] = user
	end

	def extract_open_id response
		session[:open_id] = /"client_id":"100266968","openid":"(.*)"}/.match(response.body)[1]
	end

	def extract_access_token response
		logger.info(response.body)
		session[:access] = /access_token=(.*)&expires_in=.*/.match(response.body)[1]
	end
end
