require 'spec_helper'

describe FollowsController do
  it "should return 401 for submit follow when not login" do
    session[:logged_in] = false
    post :create
    response.code.should == "401"
  end
end