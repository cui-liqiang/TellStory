class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title, :null => false
      t.text :content, :null => false
      t.integer :current_round, :default => 1

      t.timestamps
    end
  end
end
