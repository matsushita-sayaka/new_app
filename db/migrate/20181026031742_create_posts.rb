class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :title
      t.integer :user_id
      t.text :main_content
      t.string :category

      t.timestamps
    end
    add_index :posts, [:user_id, :created_at]
  end
end
