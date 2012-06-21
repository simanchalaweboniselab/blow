class Api::ApisController < ApplicationController

  skip_before_filter :verify_authenticity_token
  respond_to :json  #respond in json format
                    # DONE api for sign_in
  def sign_in
    user = User.find_for_database_authentication(:email => params[:email])
    @video = Video.all
    if user.valid_password?(params[:password])
      respond_with do |format|
        format.json {render :json => {:video => @video,:authentication_token => user.authentication_token, :first_name => user.first_name, :last_name => user.last_name  }}
        #format.json {render :json => {:success => true,:auth_token => user.authentication_token, :first_name => user.first_name, :last_name => user.last_name }}
      end
    else
      respond_with do |format|
        format.json {render :json => {:success => false , :error => "Invalid email or password"}}
      end
    end
  end
                    # DONE api for sign_up
  def create      # sign_up api for user
    user = User.new
    if user.is_a_valid_email?(params[:email])#check email format
      if user.check_password(params[:password]) #check password length
        if user.set_attributes(params[:email],params[:password],params[:first_name],params[:last_name])#calling method set_attributes of user model
          respond_with do |format|
            format.json {render :json => {:success => true, :message => "first confirm account"}}
          end
        else
          respond_with do |format|
            format.json {render :json => {:success => false , :error => "email already exist"}}
          end
        end
      else
        respond_with do |format|
          format.json {render :json => {:success => false , :error => "password not less than 6 character."}}
        end
      end
    else
      respond_with do |format|
        format.json {render :json => {:success => false , :error => "not a valid email"}}
      end
    end
  end
                    #DONE api for reset_password
  def reset_password    # reset_password for user
    if user = User.find_by_authentication_token( params[:authentication_token])
      if user.valid_password?(params[:old_password])
        if user.check_password(params[:new_password])
          user.update_attributes(:password => params[:new_password])
          respond_with do |format|
            format.json {render :json => {:success => true, :message => "password changed"}}
          end
        else
          respond_with do |format|
            format.json {render :json => {:success => false , :error => "password not less than 6 character."}}
          end
        end
      else
        respond_with do |format|
          format.json {render :json => {:success => false , :error => "enter correct old password."}}
        end
      end
    else
      respond_with do |format|
        format.json {render :json => {:success => false}}
      end
    end
  end
  ##DONE api for video search
  #def video_search
  #  @video = Video.where("title like ?", params[:title]+"%")
  #  respond_with do |format|
  #    format.json {render :json => {:video => @video, :v => @video }}
  #  end
  #end
  ##DONE api for video search on tag basis
  #def tag_search
  #  tag = Tag.find_by_name(params[:name])
  #  @video = tag.videos
  #  respond_with do |format|
  #    format.json {render :json => {:video => @video }}
  #  end
  #end
  ##DONE api for video search on category basis
  #def category_search
  #  category = Category.find_by_name(params[:name])
  #  @video = category.videos
  #  respond_with do |format|
  #    format.json {render :json => {:video => @video }}
  #  end
  #end
  #3DONE api for display comments on particular video
  #def video
  #  video = Video.find(params[:video_id])
  #  if video != nil
  #    comment = video.comments
  #    respond_with do |format|
  #      format.json {render :json => {:success => true, :video => video, :comments => comment}}
  #    end
  #  else
  #    respond_with do |format|
  #      format.json {render :json => {:success => false}}
  #    end
  #  end
  #end
  ##DONE api for create comment on particular video
  #def comment  #create comment
  #  comment = Comment.new
  #  if comment.create_comment(params[:body], params[:video_id])
  #    respond_with do |format|
  #      format.json {render :json => {:success => true, :message => "comment successfully posted"}}
  #    end
  #  else
  #    respond_with do |format|
  #      format.json {render :json => {:success => false}}
  #    end
  #  end
  #end
end
