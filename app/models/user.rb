class User < ActiveRecord::Base
  attr_accessible :display_name, :name
end
