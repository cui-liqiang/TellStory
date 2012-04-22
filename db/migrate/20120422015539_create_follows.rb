class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.text :content, :null => false
      t.integer :story_id, :references => :stories
      t.integer :round
      t.boolean :adopted, :default => false
      t.integer :votes, :default => 0

      t.timestamps
    end
  end
end
