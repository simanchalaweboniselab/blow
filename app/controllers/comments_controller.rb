class CommentsController < ApplicationController
  respond_to :json  #respond in json format
  ##DONE api for create comment on particular video
  def comment  #create comment
    comment = Comment.new
    if comment.create_comment(params[:body], params[:video_id])#calling create_comment method of Comment model
      respond_with do |format|
        format.json {render :json => {:success => true, :message => "comment successfully posted"}}
      end
    else
      respond_with do |format|
        format.json {render :json => {:success => false}}
      end
    end
  end
end
