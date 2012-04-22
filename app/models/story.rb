class Story < ActiveRecord::Base
  attr_accessible :content, :current_round, :title

  has_many :follows

  def adopted_follows
  	follows.collect {|follow| follow.adopted}
  end

  def current_follows
  	follows.collect {|follow| follow.round == current_round}
  end
end
