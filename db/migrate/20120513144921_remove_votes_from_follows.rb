class RemoveVotesFromFollows < ActiveRecord::Migration
  def up
  	remove_column :follows, :votes
  end

  def down
  end
end
