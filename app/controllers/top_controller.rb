class TopController < ApplicationController
	
	before_action :authenticate_user!
	layout "navBar"

  def index
  end
end
