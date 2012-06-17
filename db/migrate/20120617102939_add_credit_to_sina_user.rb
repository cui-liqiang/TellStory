class AddCreditToSinaUser < ActiveRecord::Migration
  def change
    add_column :sina_users, :credit, :integer, :default => 0

    SinaUser.all.each do |user|
      user.credit += Story::CREDIT * user.stories.size
      user.credit += Follow::CREDIT * user.follows.size
      user.credit += Comment::CREDIT * user.comments.size
      user.credit += Vote::CREDIT * user.votes.size
      user.save
    end
  end
end
