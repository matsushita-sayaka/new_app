class RemoveIndex < ActiveRecord::Migration[5.1]
  def change
    remove_index :post_details, [:post_id, :created_at]
  end
end
