module Admin
  class StoriesController < AdminController
    def index
      @stories = Story.order('updated_at desc')
    end

    def destroy
      Story.find(params[:id]).destroy
      redirect_to admin_stories_url
    end

    def edit
      @story = Story.find(params[:id])
    end
  end
end