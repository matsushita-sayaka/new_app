class RenameWrittenUserColumnToWrittenUserId < ActiveRecord::Migration
  def change
    rename_column :talks, :written_user, :written_user_id
    rename_column :talks, :receiver_user, :receiver_user_id
  end
end
