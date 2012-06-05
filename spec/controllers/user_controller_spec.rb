require 'spec_helper'

describe UsersController do
  it "should not update password if password is not given" do
    user = User.find(1)
    user.update_attribute :confirmation_hash, "hash"
    lambda do
      get :confirm, :user_id => 1, :confirmation_hash => "hash"
    end.should_not change user, :encrypted_password
  end

  context "when logged in" do
    before :each do
      @user = User.create :email => "mail@name.com", :password => "password", :password_confirmation => "password"
      session[:user] = @user
      session[:logged_in] = true
    end

    it "should update password if password is given" do
      lambda do
        put :update, :user => {:display_name => "some name", :password => "changedpwd", :password_confirmation => "changedpwd"}
      end.should change @user, :encrypted_password
    end

    it "should update display name if display name is different" do
      lambda do
        put :update, :user => {:display_name => "some name", :password => "changedpwd", :password_confirmation => "changedpwd"}
      end.should change @user, :display_name
    end
  end
end