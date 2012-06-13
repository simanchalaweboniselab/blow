class AddVideoIdToTag < ActiveRecord::Migration
  def change
    add_column :tags, :video_id, :integer
  end
end
