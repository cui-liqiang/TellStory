module Admin
  class CommentsController < AdminController
    def destroy
      Comment.find(params[:id]).destroy
      redirect_to edit_admin_story_follow_url(params[:follow_id])
    end
  end
end