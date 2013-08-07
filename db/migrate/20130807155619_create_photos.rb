class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :cell_id
      t.string :src
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
