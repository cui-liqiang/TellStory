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

  def update
    user_attr = params[:user]
    current_user.password = user_attr[:password]
    current_user.password_confirmation = user_attr[:password_confirmation]
    current_user.display_name = user_attr[:display_name]
    @user = current_user
    if current_user.save
      redirect_to "/profile", :notice => "信息成功更新"
      return
    end
    render :show
  end

  def new
    if session[:logged_in]
      redirect_to "/"
      return
    end
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
