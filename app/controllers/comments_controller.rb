class CommentsController < ApplicationController
	before_filter :get_follow
	def create
		comment = Comment.create(params[:comment])
		comment.user = current_user
		@follow.comments << comment
		render :text => "ok"
	end

	def index
		@comment = Comment.new
		render :layout => false
	end

	private
	def get_follow
		@follow = Follow.find(params[:follow_id])
	end
end
