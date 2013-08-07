class RenamePhotosFromSrcToImg < ActiveRecord::Migration
  def change
    rename_column :photos, :src, :img
  end
end
