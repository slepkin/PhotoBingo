class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :game_id
      t.integer :subject_id
      t.string :body

      t.timestamps
    end
  end
end
