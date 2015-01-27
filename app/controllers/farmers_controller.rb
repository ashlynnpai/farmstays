class FarmersController < ApplicationController
  before_filter :require_user
  before_filter :require_farmer
  
  def require_farmer
    unless current_user.farmer?
      flash[:danger] = "That's for farmers only, sorry."
      redirect_to home_path
    end
  end   
end