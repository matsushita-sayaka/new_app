class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.text :message
      t.integer :written_user
      t.integer :receiver_user

      t.timestamps
    end
    add_index :talks, [:created_at]
  end
end
