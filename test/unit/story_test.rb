require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "can do mass-assignment" do
    attrs =
        {:name => "name",
         :email => "email@mail.com",
         :display_name => "name",
         :head => "img",
         :password => "password",
         :password_confirmation => "password",
        }
    user = User.new attrs
    assert user.save
  end
end
