class VideosController < ApplicationController
  respond_to :json  #respond in json format

  #DONE api for video search
  def search
    @video = Video.where("title like ?", params[:title]+"%")
    #@video = @video.each do |v|
    #  v.created_at.in_time_zone.to_json = v.created_at.strftime("%d:%m:%y %H:%M:%S")
    #end
    respond_with do |format|
      format.json {render :json => {:video => @video }}
      #format.json {render :json =>  @video.to_json(:methods => :short_date, :except => [:created_at, :updated_at])}

    end
  end
  #DONE api for all comments of particular video
  def comments
    if video = Video.find_by_id(params[:video_id])
      @comment = video.comments
      if @comment.empty?
        respond_with do |format|
          format.json {render :json => {:success => true, :video => video, :comments => "no comments"}}
        end
      else
        respond_with do |format|
          format.json {render :json => {:success => true, :video => video, :comments => @comment}}
        end
      end
    else
      respond_with do |format|
        format.json {render :json => {:success => false}}
      end
    end
  end
  #DONE api for how many times views the video/calculate viewers
  def video_views
    if video = Video.find_by_id(params[:video_id])
      video.update_attributes(:views => video.views+1)
      respond_with do |format|
        format.json {render :json => {:success => true}}
      end
    else
      respond_with do |format|
        format.json {render :json => {:success => false}}
      end
    end
  end
#def index
#  @videos = Video.all
#  respond_to do |format|
#    format.html
#    format.json { render json: @videos }
#  end
#end
# # COOL show action of video
#def show
#  @video = Video.find(params[:id])
#  respond_to do |format|
#    format.html
#    format.json { render json: @video }
#  end
#end
#def new
#  @video = Video.new
#  @categories = Category.all
#  respond_to do |format|
#    format.html
#    format.json { render json: @video }
#  end
#end
#def edit
#  @video = Video.find(params[:id])
#  @categories = Category.all
#end
#def create
#  @video = Video.new(params[:video])
#  @video.category_id = params[:category][:id]
#  logger.info"================================#{params[:tag_tokens].class}"
#  tag_tokens=params[:tag_tokens].split(",")
#  tag_tokens.each do |tag|
#    vt=@video.video_tags.new
#    vt.tag_id=tag.to_i
#    vt.save
#  end
#  respond_to do |format|
#    if @video.save
#      format.html { redirect_to @video, notice: 'Video was successfully created.' }
#      format.json { render json: @video, status: :created, location: @video }
#    else
#      format.html { render action: "new" }
#      format.json { render json: @video.errors, status: :unprocessable_entity }
#    end
#  end
#end
#def update
#  logger.info"dfjlsdfkjsdfsdflsdfjasdlf sd#{params.inspect}"
#  @video = Video.find(params[:id])
#  @video.category_id = params[:category][:id]
#  respond_to do |format|
#    if @video.update_attributes(params[:video])
#      format.html { redirect_to @video, notice: 'Video was successfully updated.' }
#      format.json { head :no_content }
#    else
#      format.html { render action: "edit" }
#      format.json { render json: @video.errors, status: :unprocessable_entity }
#    end
#  end
#end
#def destroy
#  @video = Video.find(params[:id])
#  @video.destroy
#  respond_to do |format|
#    format.html { redirect_to videos_url }
#    format.json { head :no_content }
#  end
#end
end
