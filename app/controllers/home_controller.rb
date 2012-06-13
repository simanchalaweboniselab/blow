class HomeController < ApplicationController
  before_filter :authenticate_user!
  #before_filter :require_admin, :only => [:show]
  def index
  end
  def show
  end
end
