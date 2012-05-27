class QQUser < ActiveRecord::Base
  attr_accessible :display_name, :name, :head

  has_many :stories
  has_many :follows
  has_many :votes
  has_many :follows, :through => :votes
  has_many :comments
end
