class AddUserForeignKeys < ActiveRecord::Migration
  def up
  	add_column :stories, :user_id, :integer
  	add_column :follows, :user_id, :integer
  	Story.all.each do |story|
  		story.update_attributes :user_id => 1
  	end
  	Follow.all.each do |follow|
  		follow.update_attributes :user_id => 1
  	end
  end

  def down
  	remove_column :stories, :user_id
  	remove_column :follows, :user_id
  end
end
