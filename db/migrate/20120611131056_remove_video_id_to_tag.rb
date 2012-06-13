class RemoveVideoIdToTag < ActiveRecord::Migration
  def up
    remove_column :tags, :video_id
      end

  def down
    add_column :tags, :video_id, :integer
  end
end
