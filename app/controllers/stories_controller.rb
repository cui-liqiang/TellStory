class StoriesController < ApplicationController
	def new
		@story = Story.new
	end

	def create
		@story = Story.new(params[:story])

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

	def update
		follow = params[:followContent]
		story = Story.find_by_id(params[:id])
		follow = Follow.create(:content => follow, :round => story.current_round)
		story.follows << follow
		render :text => follow.id
	end
end