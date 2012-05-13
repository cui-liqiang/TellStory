class Follow < ActiveRecord::Base
  attr_accessible :adopted, :content, :round, :story_id, :user_id

  belongs_to :user
  has_many :votes
  has_many :users, :through => :votes
end
