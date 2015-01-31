class Farmer::UsersController < FarmersController
  before_filter :require_user
  before_filter :require_farmer
  
  def dashboard
    @farmer = User.find(params[:id])
    @farms = @farmer.farms.all
  end  
end

