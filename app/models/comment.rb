class Comment < ActiveRecord::Base
  attr_accessible :content, :user

  belongs_to :user, :class_name => SinaUser, :foreign_key => :user_id
  belongs_to :follow

  CREDIT = 2
end
