# encoding: utf-8
module Poster
	def post_weibo story
		response = HTTParty.post("https://graph.qq.com/t/add_t", 
			:body => "access_token=#{session[:access]}&oauth_consumer_key=#{app_id}&openid=#{session[:open_id]}&format=json&content=" +
			post_content(story),
			:headers => {
			"Content-Type" => "application/x-www-form-urlencoded"
			})
	end

	def post_content story
		random = (rand * 10000).to_s[0..3]
		"#{random}我在转角童话上面参与了一篇故事“#{story.title}”，大家去看看，续写一下吧~ http://www.tellstoryto.us/stories/#{story.id}"
	end
end