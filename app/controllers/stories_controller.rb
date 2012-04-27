class StoriesController < ApplicationController
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
      		else
        		format.html { render :action => "new" }
      		end
    	end
	end

	def show
		@story = Story.find_by_id(params[:id])
	end

	def index
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
		render :text => follow.id
	end
end