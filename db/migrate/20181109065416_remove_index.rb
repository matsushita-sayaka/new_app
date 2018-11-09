class RemoveIndex < ActiveRecord::Migration
  def change
    remove_index :post_details, [:post_id, :created_at]
  end
end
