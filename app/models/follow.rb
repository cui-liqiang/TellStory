class Follow < ActiveRecord::Base
  attr_accessible :adopted, :content, :round, :story_id, :votes, :user_id

  belongs_to :user
  has_many :votes
  has_many :users, :through => :votes
end
