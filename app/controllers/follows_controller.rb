class FollowsController < ApplicationController
	def update
		follow = Follow.find_by_id(params[:id])
		follow.votes += 1
		follow.save
		render :text => follow.votes.to_s
	end
end
