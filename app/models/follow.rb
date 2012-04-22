class Follow < ActiveRecord::Base
  attr_accessible :adopted, :content, :round, :story_id, :votes
end
