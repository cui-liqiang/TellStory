class CreateSinaUsers < ActiveRecord::Migration
  def change
    create_table :sina_users do |t|
      t.string :sina_id
      t.string :display_name
      t.string :head

      t.timestamps
    end
  end
end
