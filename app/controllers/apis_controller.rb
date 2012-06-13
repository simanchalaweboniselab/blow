class ApisController < ApplicationController

  skip_before_filter :verify_authenticity_token
  respond_to :json

  def sign_in
    user = User.find_for_database_authentication(:email => params[:email])
    @video = Video.all
    if user.valid_password?(params[:password])
      respond_with do |format|
        format.json {render :json => {:video => @video }}
        #format.json {render :json => {:success => true,:auth_token => user.authentication_token, :first_name => user.first_name, :last_name => user.last_name }}
      end
    else
      respond_with do |format|
        format.json {render :json => {:success => false , :error => "Invalid email or password"}}
      end
    end
  end
  def create
    user = User.new
    if user.set_attributes(params[:email],params[:password],params[:first_name],params[:last_name])
      respond_with do |format|
        format.json {render :json => {:success => true,:auth_token => user.authentication_token, :first_name => user.first_name, :message => "first confirm account"}}
      end
      return
    else
      respond_with do |format|
        format.json {render :json => {:success => false , :error => "enter correct information"}}
      end
    end
  end
  def reset_password
    user = User.find_by_authentication_token( params[:auth_token])
    if user != nil
      user.update_attributes(:password => params[:password])
      respond_with do |format|
        format.json {render :json => {:success => true}}
      end
    else
      respond_with do |format|
        format.json {render :json => {:success => false}}
      end
    end
  end
end
