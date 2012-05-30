class AddActiveAndConfirmationColumnToUsers < ActiveRecord::Migration
  def up
    add_column :users, :active, :boolean, :default => false
    add_column :users, :confirmation_hash, :string
  end

  def down
    drop_column :users, :active
    drop_column :users, :confirmation_hash
  end
end
