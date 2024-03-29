class CategoriesController < ApplicationController
  #before_filter :authenticate_user!
  #before_filter :require_admin
  respond_to :json  #respond in json format
                    ##DONE api for video search on tag basis
  def search
    if category = Category.find_by_name(params[:name])
      @video = category.videos
      respond_with do |format|
        format.json {render :json => {:success => true, :video => @video }}
      end
    else
      respond_with do |format|
        format.json {render :json => {:success => false}}
      end
    end
  end
  #def index
  #  @categories = Category.all
  #  respond_to do |format|
  #    format.html
  #    format.json { render json: @categories }
  #  end
  #end
  #def show
  #  @category = Category.find(params[:id])
  #  if request.path != category_path(@category)
  #    redirect_to @category, status: :moved_permanently
  #  end
  #  respond_to do |format|
  #    format.html
  #    format.json { render json: @category }
  #  end
  #end
  #def new
  #  @category = Category.new
  #  respond_to do |format|
  #    format.html
  #    format.json { render json: @category }
  #  end
  #end
  #def edit
  #  @category = Category.find(params[:id])
  #end
  #def create
  #  @category = Category.new(params[:category])
  #  respond_to do |format|
  #    if @category.save
  #      format.html { redirect_to @category, notice: 'Category was successfully created.' }
  #      format.json { render json: @category, status: :created, location: @category }
  #    else
  #      format.html { render action: "new" }
  #      format.json { render json: @category.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
  #def update
  #  @category = Category.find(params[:id])
  #  respond_to do |format|
  #    if @category.update_attributes(params[:category])
  #      format.html { redirect_to @category, notice: 'Category was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @category.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
  #def destroy
  #  @category = Category.find(params[:id])
  #  @category.destroy
  #  respond_to do |format|
  #    format.html { redirect_to categories_url }
  #    format.json { head :no_content }
  #  end
  #end
end
