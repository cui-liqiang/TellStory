# encoding: utf-8
require 'poster'
class StoriesController < ApplicationController
	before_filter :login_validate, :except => [:index]

	include Poster

	def new
		@story = Story.new
	end

	def create
		@story = Story.new(params[:story])
		@story.round_time = DateTime.now
		@story.hot = 0
		@story.user = current_user

		respond_to do |format|
      		if @story.save
        		format.html { redirect_to(@story, :notice => 'Story was successfully created.') }
        		#post_weibo @story
      		else
        		format.html { render :action => "new" }
      		end
    	end
	end

	def show
		@story = Story.find_by_id(params[:id])
	end

	def index
		redirect_to "/login?code=#{params[:code]}"  unless params[:code].nil?
		@stories = Story.limit(10).order('hot desc')
    @user = User.new
	end

	private

	def login_validate
		redirect_to "/oauth" unless session[:logged_in]
	end
end