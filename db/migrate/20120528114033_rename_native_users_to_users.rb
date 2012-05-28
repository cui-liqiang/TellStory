class RenameNativeUsersToUsers < ActiveRecord::Migration
  def up
    rename_table :native_users, :users
  end

  def down
    rename_table :users, :native_users
  end
end
