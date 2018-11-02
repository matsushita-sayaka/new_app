class AddMessageToFriens < ActiveRecord::Migration
  def change
    add_column :friends, :message, :text
  end
end
