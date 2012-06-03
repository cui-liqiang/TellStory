# encoding: utf-8
class UsersController < ApplicationController
  before_filter :login_validate, :except => [:new, :create, :confirm]

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

  def show
    @user = current_user
  end

  def confirm
    @user = User.find(params[:user_id])
    if @user.nil? or @user.confirmation_hash != params[:confirmation_hash]
      render "invalid_confirmation"
    end
    @user.update_attribute :active, true
    session[:user] = @user
    session[:logged_in] = true
  end

end
