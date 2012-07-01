module Admin
  class FollowsController < AdminController
    def destroy
      Follow.find(params[:id]).destroy
      redirect_to edit_admin_story_url(params[:story_id])
    end

    def edit
      @follow = Follow.find(params[:id])
    end
  end
end