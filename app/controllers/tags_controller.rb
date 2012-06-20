class TagsController < ApplicationController
  respond_to :json  #respond in json format
  def search
    if tag = Tag.find_by_name(params[:name])
      @video = tag.videos
      respond_with do |format|
        format.json {render :json => {:success => true,:video => @video }}
      end
    else
      respond_with do |format|
        format.json {render :json => {:success => false}}
      end
    end
  end
  #def index
  #  @tags = Tag.where("name like ?", "%#{params[:q]}%")
  #  respond_to do |format|
  #    format.html
  #    format.json { render :json => @tags.map(&:attributes) }
  #  end
  #end
end
