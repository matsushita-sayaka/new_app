class AddMessageToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :message, :text
  end
end
