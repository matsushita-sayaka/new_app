class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.integer :user_id_rq
      t.string :status

      t.timestamps
    end
    add_index :friends, [:user_id, :user_id_rq], unique: true
  end
end
