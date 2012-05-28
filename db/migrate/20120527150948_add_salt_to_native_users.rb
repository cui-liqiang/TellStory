class AddSaltToNativeUsers < ActiveRecord::Migration
  def change
    add_column :native_users, :salt, :string
  end
end
