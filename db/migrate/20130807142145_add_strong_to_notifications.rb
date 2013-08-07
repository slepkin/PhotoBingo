class AddStrongToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :strong, :boolean, default: false
  end
end
