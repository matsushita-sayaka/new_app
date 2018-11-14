class CreatePostDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :post_details do |t|
      t.integer :post_id
      t.string :image
      t.text :content

      t.timestamps
    end
    add_index :post_details, [:post_id, :created_at]
  end
end
