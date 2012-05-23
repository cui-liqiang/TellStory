class Follow < ActiveRecord::Base
  attr_accessible :adopted, :content, :round, :story_id, :user

  belongs_to :user
  has_many :votes
  has_many :users, :through => :votes
  has_many :comments
end
