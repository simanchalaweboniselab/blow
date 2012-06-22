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
  #TODO api for most popular videos(based on views)
  def most_popular_videos
    if @video = Video.select("views, title, video_url, image_url").all(:order => "views desc")
      respond_with do |format|
        format.json {render :json => {:success => true, :video => @video}}
      end
    else
      respond_with do |format|
        format.json {render :json => {:success => false}}
      end
    end
  end
end
