ActiveAdmin.register Tag do
  filter :name
  controller do
    #def index
    #  @tags = Tag.where("name like ?", "%#{params[:q]}%")
    #  #@tags = Tag.all
    #  respond_to do |format|
    #    format.html
    #    format.json { render :json => @tags.map(&:attributes) }
    #  end
    #end
  end
end
