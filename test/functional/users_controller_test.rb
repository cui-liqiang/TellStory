require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should create user" do
    attrs =
        {
         :email => "email@mail.com",
         :display_name => "name",
         :password => "password",
         :password_confirmation => "password",
        }
    assert_difference('User.count') do
      post :create, :user => attrs
    end
  end
end
