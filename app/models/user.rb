class User < ActiveRecord::Base
  attr_accessible :display_name, :name, :head

  has_many :stories
  has_many :follows
end
