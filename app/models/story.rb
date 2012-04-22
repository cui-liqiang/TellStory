class Story < ActiveRecord::Base
  attr_accessible :content, :current_round, :title

  has_many :follows
end
