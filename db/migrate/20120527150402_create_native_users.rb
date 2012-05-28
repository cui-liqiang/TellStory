class CreateNativeUsers < ActiveRecord::Migration
  def change
    create_table :native_users do |t|
      t.string :name
      t.string :email
      t.string :encrypted_password

      t.timestamps
    end
  end
end
