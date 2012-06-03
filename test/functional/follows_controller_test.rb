require 'test_helper'

class FollowsControllerTest < ActionController::TestCase
  test "should create follow and assign the related attribute" do
    session[:user] = users(:user1)
    #session[:logged_in] = true
    post :create, :story_id => 1, :follow => {:content => "some content"}
    follow = Follow.find_by_content("some content")
    assert_equal User.find(1), follow.user
    assert_equal 1, follow.round
    assert_equal 1, Story.find(1).hot
  end
end