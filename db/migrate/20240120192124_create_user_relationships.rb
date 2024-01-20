class CreateUserRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :user_relationships do |t|
      t.integer :follower_id
      t.integer :followee_id

      t.timestamps
    end

    add_index :user_relationships, :follower_id
    add_index :user_relationships, :followee_id
    add_index :user_relationships, [:follower_id, :followee_id], unique: true
  end
end
