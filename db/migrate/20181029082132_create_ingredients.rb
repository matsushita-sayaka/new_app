class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.integer :user_id
      t.integer :check_box
      t.integer :recipe_id

      t.timestamps
    end
  end
end
