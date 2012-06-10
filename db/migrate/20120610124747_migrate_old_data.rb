# encoding: utf-8
class MigrateOldData < ActiveRecord::Migration
  def up
    user = SinaUser.create :sina_id => "1665009157", :display_name => "天天的老师", :head => "http://tp2.sinaimg.cn/1665009157/50/1294477644/1"
    Story.all.each do |story|
      story.update_attribute :user_id, user.id
    end
    Follow.all.each do |follow|
      follow.update_attribute :user_id, user.id
    end
    Comment.all.each do |comment|
      comment.update_attribute :user_id, user.id
    end
    Vote.all.each do |vote|
      vote.update_attribute :user_id, user.id
    end
  end

  def down
  end
end
