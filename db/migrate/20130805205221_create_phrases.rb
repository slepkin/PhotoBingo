class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.string :body
      t.integer :theme_id

      t.timestamps
    end
  end
end
