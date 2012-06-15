class VideosController < ApplicationController
  def index
    @videos = Video.all
    respond_to do |format|
      format.html
      format.json { render json: @videos }
    end
  end
  def show
    @video = Video.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @video }
    end
  end
  def new
    @video = Video.new
    @categories = Category.all
    respond_to do |format|
      format.html
      format.json { render json: @video }
    end
  end
  def edit
    @video = Video.find(params[:id])
    @categories = Category.all
  end
  def create
    @video = Video.new(params[:video])
    @video.category_id = params[:category][:id]
    logger.info"================================#{params[:tag_tokens].class}"
    tag_tokens=params[:tag_tokens].split(",")
    tag_tokens.each do |tag|
      vt=@video.video_tags.new
      vt.tag_id=tag.to_i
      vt.save
    end
    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render json: @video, status: :created, location: @video }
      else
        format.html { render action: "new" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    logger.info"dfjlsdfkjsdfsdflsdfjasdlf sd#{params.inspect}"
    @video = Video.find(params[:id])
    @video.category_id = params[:category][:id]
    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :no_content }
    end
  end
end
