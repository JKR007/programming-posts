class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.datetime :published_at

      t.timestamps
    end

    add_index :posts, :title 
    add_index :posts, :published_at 
  end
end
