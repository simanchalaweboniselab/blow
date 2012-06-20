ActiveAdmin.register Comment, :as => "VideoComment" do
  filter :video, :label => 'Video'
  index do
      column "Id" do |f|
        link_to(f.id, admin_video_comment_path(f))
      end
      column :active
      column :body
      column :video_id
      #column "Created_at" do |f|
      #  f.created_at..strftime("%m/%d/%y")
      #end
      column :updated_at
      default_actions
    end
end
