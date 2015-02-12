class Farmer::UsersController < FarmersController
  before_filter :require_user
  before_filter :require_farmer
  
  def dashboard
    @farmer = User.find_by slug: (params[:id])
    if @farmer
      dashboard_owner
      @farms = @farmer.farms.all
    else 
      redirect_to root_path
    end
  end  
  
  private
  
  def dashboard_owner
    unless logged_in? and (current_user == @farmer) or current_user.admin?
      redirect_to root_path
    end
  end
end

