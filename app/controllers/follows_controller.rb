# encoding: utf-8
class FollowsController < ApplicationController
	def update
		follow = Follow.find_by_id(params[:id])
		if follow.users.include?(current_user)
			render :text => "你已经投过这个了，不可以重复投票哦", :status => 403
		else
			follow.users << current_user
			render :text => follow.votes.size.to_s
		end
	end
end
