require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "create comment and bind the related value" do
    session[:user] = users(:user1)
    post :create, :follow_id => 1, :comment => {:content => "some comment content"}
    comment = Comment.find_by_content("some comment content")
    assert_equal User.find(1), comment.user
    assert_equal Follow.find(1), comment.follow
  end
end
