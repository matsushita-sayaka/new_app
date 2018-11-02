class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.text :proverb
      t.string :speaker

      t.timestamps
    end
  end
end
