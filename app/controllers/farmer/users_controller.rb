class Farmer::UsersController < FarmersController
  before_filter :require_user
  before_filter :require_farmer
  
  def dashboard
    @farmer = User.find_by slug: (params[:id])
    if @farmer == nil
      redirect_to root_path
    else  
      @farms = @farmer.farms.all
    end
  end  
end

