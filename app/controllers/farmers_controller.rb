class FarmersController < ApplicationController
  before_filter :require_user
  before_filter :require_farmer 
  
  def require_farmer
    unless current_user.farmer? or current_user.admin?
      redirect_to root_path
    end
  end   
  
  def require_same_farmer
    unless logged_in? and (current_user == @farm.farmer) or current_user.admin?
      redirect_to farm_path(@farm) 
    end
  end
end