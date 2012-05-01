# encoding: utf-8
class StoriesController < ApplicationController
	before_filter :login_validate, :except => [:index]

	def new
		@story = Story.new
	end

	def create
		@story = Story.new(params[:story])
		@story.round_time = DateTime.now
		@story.hot = 0

		respond_to do |format|
      		if @story.save
        		format.html { redirect_to(@story, :notice => 'Story was successfully created.') }
        		post_weibo @story
      		else
        		format.html { render :action => "new" }
      		end
    	end
	end

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
		"#{random}我在转角童话上面参与了一篇故事“#{story.title}”，大家去看看，续写一下吧~ http://stormy-day-2454.herokuapp.com/stories/#{story.id}"
	end

	def show
		@story = Story.find_by_id(params[:id])
	end

	def index
		redirect_to "/login?code=#{params[:code]}"  unless params[:code].nil?
		@stories = Story.limit(10).order('hot desc')
	end

	def update
		follow = params[:followContent]
		story = Story.find_by_id(params[:id])
		ActiveRecord::Base.transaction do
			follow = Follow.create(:content => follow, :round => story.current_round)
			story.follows << follow
			story.update_attributes :hot => story.hot + 1
		end
		post_weibo story
		render :text => follow.id
	end

	def login_validate
		redirect_to "/oauth" unless session[:logged_in]
	end
end