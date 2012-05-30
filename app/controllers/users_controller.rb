# encoding: utf-8
class UsersController < ApplicationController
  def create
    @user = user_from_params
    if !@user.save
      render "new"
    else
    end
    #if params[:commit] == "登陆"
    #  handle_login
    #else
    #  handle_register
    #end
  end

  def user_from_params
    user = User.new
    user.email = params[:user][:email]
    user.password = params[:user][:password]
    user.password_confirmation = params[:user][:password_confirmation]
    user.display_name = params[:user][:display_name]
    user
  end

  def new
    @user = User.new
  end

  private

  def handle_register
    user = User.new
    user.email = params[:user][:email]
    user.password = params[:user][:password]
    user.save
    session[:user] = user
    session[:logged_in] = true
    redirect_to "/"
  end

  def handle_login
    @user = User.authenticate(params[:user][:email], params[:user][:password])
    if @user.nil?
      @user = User.new
      redirect_to "/"
    else
      session[:user] = @user
      session[:logged_in] = true
      redirect_to "/"
    end
  end
end
