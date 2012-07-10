# encoding: utf-8
module SinaPoster
	def post_weibo story
		response = HTTParty.post("https://api.weibo.com/2/statuses/update.json",
			:body => "access_token=#{session[:access_token]}&status=" + post_content(story))
	end

	def post_content story
		random = (rand * 10000).to_s[0..3]
		"#{random}我在转角童话上面参与了一篇故事“#{story.title}”，大家去看看，续写一下吧~ http://www.tellstoryto.us/stories/#{story.id}"
	end
end