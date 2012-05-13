class Vote < ActiveRecord::Base
  attr_accessible :follow_id, :user_id

  belongs_to :follow
  belongs_to :user
end
