# encoding: utf-8
class UsersController < ApplicationController
  def create
    @user = User.new params[:user]
    if !@user.save
      render "new"
    else
      UserMailer.registration_confirmation(@user).deliver
    end
  end

  def new
    @user = User.new
  end

  def confirm
    @user = User.find(params[:user_id])
    if(@user.nil? or @user.confirmation_hash != params[:confirmation_hash])
      render "invalid_confirmation"
    end
    @user.update_attribute :active, true
    session[:user] = @user
    session[:logged_in] = true
  end

end
