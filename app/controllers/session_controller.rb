class SessionController < ApplicationController
	include HTTParty

	base_uri 'https://graph.qq.com'

	def create
		if(!session[:logged_in])
			code = params[:code]
			random = 'random'
			access_token_response = self.class.get("/oauth2.0/token?grant_type=authorization_code&client_id=100266968&" + 
						"client_secret=#{app_key}&code=#{code}&state=#{random}&redirect_uri=#{callback}")
			open_id_response = self.class.get("/oauth2.0/me?access_token=#{extract_access_token(access_token_response)}")
			extract_open_id(open_id_response)
			extract_user_info
			session[:logged_in] = true
		end
		redirect_to '/'
	end

	def new
		redirect_to "https://graph.qq.com/oauth2.0/authorize?response_type=code" + 
					"&client_id=#{app_id}&redirect_uri=#{callback}&scope=get_info,add_t"
	end

	def extract_user_info
		response = self.class.get("/user/get_info?access_token=#{session[:access]}&oauth_consumer_key=#{app_id}&openid=#{session[:open_id]}")
		session[:user] = JSON.parse(response.body)
	end

	def extract_open_id response
		session[:open_id] = /"client_id":"100266968","openid":"(.*)"}/.match(response.body)[1]
	end

	def extract_access_token response
		logger.info(response.body)
		session[:access] = /access_token=(.*)&expires_in=.*/.match(response.body)[1]
	end

	def callback
		"stormy-day-2454.herokuapp.com"
	end

	def app_key
		"859b88ec720d4b910351e9408bc5cec6"
	end

	def app_id
		"100266968"
	end
end
