class DropInvite < ActiveRecord::Migration[5.1]
  def change
    drop_table :invites
  end
end
