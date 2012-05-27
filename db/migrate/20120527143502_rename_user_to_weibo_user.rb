class RenameUserToWeiboUser < ActiveRecord::Migration
  def up
    rename_table :users, :qq_users
  end

  def down
    rename_table :qq_users, :users
  end
end
