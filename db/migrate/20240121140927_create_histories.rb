class CreateHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
      t.string :action
      t.integer :user_id
      t.json :tracked_changes
      t.references :trackable, polymorphic: true, null: false

      t.timestamps
    end

    add_index :histories, :user_id
  end
end
