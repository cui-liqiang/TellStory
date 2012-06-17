class Follow < ActiveRecord::Base
  attr_accessible :adopted, :content, :round, :story_id, :user

  belongs_to :user, :class_name => SinaUser, :foreign_key => :user_id
  belongs_to :story
  has_many :votes
  has_many :users, :through => :votes, :class_name => SinaUser, :foreign_key => :user_id
  has_many :comments

  CREDIT = 4
end
