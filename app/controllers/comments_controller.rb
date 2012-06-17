class CommentsController < ApplicationController
	before_filter :get_follow
	def create
		ActiveRecord::Base.transaction do
			@comment = @follow.comments.create(params[:comment].merge(:user => current_user))
      @comment.follow.story.update_attribute :updated_at, Time.now
			render "comments/one_comment", :layout => false
		end
	end

	def index
		@story = Story.find(params[:story_id])
		render :layout => false
	end

	private
	def get_follow
		@follow = Follow.find(params[:follow_id])
	end
end
