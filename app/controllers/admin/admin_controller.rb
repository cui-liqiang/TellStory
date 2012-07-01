module Admin
  class AdminController < ApplicationController
    before_filter :check_user_privilege

    def check_user_privilege
      redirect_to root_url unless session[:logged_in] && current_user.sina_id == "1665009157"
    end
  end
end