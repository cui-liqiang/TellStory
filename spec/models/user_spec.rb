require 'spec_helper'

describe User do
  before :each do
    @user = FactoryGirl.create(:user)
  end

  it "should give the default head if head is nil" do
    @user.head.should == "/assets/default_head.jpg"
  end

  it "should give the head if head is not nil" do
    @user.update_attribute :head, "http://somelink.to/your/head.jpg"
    @user.head.should == "http://somelink.to/your/head.jpg"
  end
end