class Vote < ActiveRecord::Base
  attr_accessible :follow_id, :user_id

  belongs_to :follow
  belongs_to :user, :class_name => SinaUser, :foreign_key => :user_id
end
