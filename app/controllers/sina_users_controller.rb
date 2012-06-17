class SinaUsersController < ApplicationController
  def show
    @user = SinaUser.find params[:id]
    @activities = []
    @activities += Story.find_all_by_user_id @user.id
    @activities += Follow.find_all_by_user_id @user.id
    @activities += Comment.find_all_by_user_id @user.id
    @activities.sort!{|a, b| b.created_at <=> a.created_at}
  end
end