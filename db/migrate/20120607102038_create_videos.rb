class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :video_url
      t.string :image_url
      t.integer :category_id

      t.timestamps
    end
  end
end
