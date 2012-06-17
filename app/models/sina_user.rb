class SinaUser < ActiveRecord::Base
  include BaseUser
  attr_accessible :sina_id

  has_many :stories, :foreign_key => :user_id
  has_many :follows, :foreign_key => :user_id
  has_many :votes, :foreign_key => :user_id
  has_many :comments, :foreign_key => :user_id

  def self.hotest_users
    self.limit(5).order('credit desc')
  end
end
