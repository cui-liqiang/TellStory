class AddDisplayNameAndHeadColoumToNativeUser < ActiveRecord::Migration
  def up
    add_column :native_users, :display_name, :string
    add_column :native_users, :head, :string
  end

  def down
    remove_column :native_users, :display_name, :string
    remove_column :native_users, :head, :string
  end
end
