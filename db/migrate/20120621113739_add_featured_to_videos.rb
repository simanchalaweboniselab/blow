class AddFeaturedToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :featured, :boolean, :default => true
    add_column :videos, :views, :integer, :default => 0
    add_column :videos, :likes, :integer, :default => 0
  end
end
