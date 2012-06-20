ActiveAdmin.register Video do
  filter :category, :label => 'Category'
  filter :video_url
  #filter :created_at
  #DONE customize new video form
  form :partial => "forms"
  # DONE Customize index page of video
  index do
    column "Id" do |f|
      link_to(f.id, admin_video_path(f))
    end
    column :title
    column :video_url
    column "Image" do |f|
      image_tag(f.image_url, :size => "30x30" )
    end
    column :created_at
    column :updated_at
    default_actions
  end
  #controller
  controller do
    #DONE override create method of video
    def create
      @video = Video.new(params[:video])
      tag_tokens=params[:tag_tokens].split(",")
      tag_tokens.each do |tag|
        vt=@video.video_tags.new
        vt.tag_id=tag.to_i
        vt.save
      end
      respond_to do |format|
        if @video.save
          format.html{ redirect_to  admin_video_path(@video) }
        else
          format.html{ redirect_to  new_admin_video_path }
        end
      end
    end
  end
end
