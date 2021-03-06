module SinaWeibo
  def self.included base
    base.send :include, HTTParty
    base.base_uri "https://api.weibo.com/oauth2"
  end

  def find_or_create_sina_user
    session[:access_token] = access_token
    SinaUser.find_or_create_by_sina_id_and_display_name_and_head(
        :sina_id => user_info['id'].to_s,
        :display_name => user_info['screen_name'],
        :head => user_info['profile_image_url']
    )
  end

  def user_info
    return @user_info if @user_info
    uid = self.class.get("https://api.weibo.com/2/account/get_uid.json?access_token=#{access_token}")
    @user_info = self.class.get("https://api.weibo.com/2/users/show.json?uid=#{uid['uid']}&access_token=#{access_token}")
  end

  def access_token
    return @access_token if @access_token
    results = self.class.post("/access_token", :query => {
        :client_id => client_id,
        :client_secret => client_secret,
        :grant_type => "authorization_code",
        :redirect_uri => callback_uri,
        :code => params[:code]
    })
    @access_token = JSON.parse(results.parsed_response)["access_token"]
  end

  def auth_url
    "https://api.weibo.com/oauth2/authorize?client_id=#{client_id}&response_type=code&redirect_uri=#{callback_uri}"
  end

  def client_secret
    "df23584e4f081ef5a3eaf34ad01f8f09"
  end

  def client_id
    "1209882826"
  end

  def callback_uri
    "http://www.tellstoryto.us/sina_callback"
  end
end