# encoding: utf-8
require 'poster'

class FollowsController < ApplicationController
	include Poster
  before_filter :check_login

	def update
		follow = Follow.find_by_id(params[:id])
		if follow.users.include?(current_user)
			render :text => "你已经投过这个了，不可以重复投票哦", :status => 403
		else
			follow.users << current_user
			render :text => follow.votes.size.to_s
		end
	end

	def create
		ActiveRecord::Base.transaction do
			@story = Story.find(params[:story_id])
			@follow = @story.follows.create(params[:follow].merge(:user => current_user,
                                                            :round => @story.current_round))
			@story.update_attributes :hot => @story.hot + 1
			#post_weibo @story
			render 'follows/one_follow', :layout => false
		end
  end

  def check_login
    render "sessions/pop_up_new", :layout => false, :status => 401 unless current_user
  end
end