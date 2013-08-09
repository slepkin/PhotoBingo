class AddEndToGames < ActiveRecord::Migration
  def change
    add_column :games, :end, :boolean, default: false
  end
end
