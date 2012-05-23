class CommentsController < ApplicationController
	before_filter :get_follow
	def create
		ActiveRecord::Base.transaction do
			@comment = Comment.create(params[:comment])
			@comment.user = current_user
			@follow.comments << @comment
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
