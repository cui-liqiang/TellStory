class SinaSessionsController < ApplicationController
  include SinaWeibo

  def create
    unless session[:logged_in]
      login(find_or_create_sina_user)
      redirect_to_callback_url
      return
    end
    redirect_to '/'
  end

  def new
    session[:redirect_to] = params[:redirect_to]
    redirect_to auth_url
  end

end