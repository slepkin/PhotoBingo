class RemoveNotifications < ActiveRecord::Migration
  def up
    change_table :notifications do |t|
      t.remove :body, :strong
      t.string :quality
      t.integer :photo_id
    end
  end

  def down
    change_table :notifications do |t|
      t.remove :quality, :photo_id
      t.boolean :strong
      t.string :body
    end
  end
end
