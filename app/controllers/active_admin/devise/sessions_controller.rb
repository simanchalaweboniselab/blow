class ActiveAdmin::Devise::SessionsController < Devise::SessionsController

  def create
    logger.info("============================================================================hellllllooooooooooooo")
    redirect_to "/", :notice => "Method Overrided"
  end

end
