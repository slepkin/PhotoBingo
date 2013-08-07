class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
