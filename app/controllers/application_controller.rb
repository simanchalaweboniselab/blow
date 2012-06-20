class ApplicationController < ActionController::Base
  protect_from_forgery
  #def after_sign_up_path_for(resource)
  #  "http://www.google.com" # <- Path you want to redirect the user to after signup
  #end
  #def after_sign_in_path_for(resource)
  #  "http://www.google.com"
  #end
  #def require_admin
  #  unless current_user.admin?
  #    flash[:notice] = "you are not admin."
  #    redirect_to root_url
  #  end
  #end
  def after_sign_in_path
    "/admin"
  end
 end
