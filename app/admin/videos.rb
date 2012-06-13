ActiveAdmin.register Video do
  form :partial => "forms"
  #index do
  #  column :id
  #  column :title
  #  column :video_url
  #  column :created_at
  #  default_actions
  #end
  #controller
  controller do
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
