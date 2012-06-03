class Comment < ActiveRecord::Base
  attr_accessible :content, :user

  belongs_to :user
  belongs_to :follow

end
