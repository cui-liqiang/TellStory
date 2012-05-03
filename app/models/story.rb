class Story < ActiveRecord::Base
  attr_accessible :content, :current_round, :title, :round_time, :hot

  has_many :follows, :order => "round ASC"

  def adopted_follows
  	follows.select {|follow| follow.adopted}
  end

  def current_follows
  	follows.select {|follow| follow.round == current_round}
  end

  def next_round
  	now = DateTime.now
  	if round_time + 24.hours < now
  		self.round_time = now
  		self.current_round += 1
  		pick_follow
  		save
  	end
  end

  def self.next_round
  	find(:all).each do |story|
  		story.next_round
  	end
  end

  private 

  def pick_follow
  	max = self.follows.max_by {|follow| follow.votes }
  	max.adopted = true and max.save unless max.nil?
  end
end
