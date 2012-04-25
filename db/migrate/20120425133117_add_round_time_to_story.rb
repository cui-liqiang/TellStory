class AddRoundTimeToStory < ActiveRecord::Migration
  def change
  	add_column :stories, :round_time, :datetime
  	Story.find(:all).each do |story|
  		story.update_attributes(:round_time => story.created_at)
  	end
  end
end
