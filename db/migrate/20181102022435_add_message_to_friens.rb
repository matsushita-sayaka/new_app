class AddMessageToFriens < ActiveRecord::Migration[5.1]
  def change
    add_column :friends, :message, :text
  end
end
