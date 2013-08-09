class AddIndicesToForeignKeys < ActiveRecord::Migration
  def change
    add_index :boards, [:game_id, :user_id]
    add_index :cells, [:board_id, :phrase_id]
    add_index :games, [:theme_id]
    add_index :notifications, [:subject_id, :game_id, :photo_id]
    add_index :photos, [:cell_id]
    add_index :phrases, [:theme_id]
    add_index :themes, [:user_id]
    add_index :visits, [:user_id, :game_id]
    add_index :votes, [:user_id, :photo_id]
  end
end
