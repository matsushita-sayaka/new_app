class RemoveFriendsFromStatus < ActiveRecord::Migration[5.1]
  def change
    remove_column :friends, :status, :string
  end
end
