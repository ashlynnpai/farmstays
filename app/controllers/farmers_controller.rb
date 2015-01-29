class FarmersController < ApplicationController
  before_filter :require_user
  before_filter :require_farmer
  
  def require_farmer
    unless current_user.farmer? or current_user.admin?
      redirect_to root_path
    end
  end   
end