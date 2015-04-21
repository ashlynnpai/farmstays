class Farmer::FarmsController < FarmersController
  before_filter :require_user
  before_filter :require_farmer
    
  def new
    @farm = Farm. new
  end    
  
  def create
    @farm = Farm.create(farm_params)
    
    if @farm.save
      flash[:success] = "Your farm profile was created."
      redirect_to farm_path(@farm)
    else
      render :new
    end
  end
  
  def edit
    @farm = Farm.find(params[:id])
    require_same_farmer
  end
  
  def update
    @farm = Farm.find(params[:id])
    if logged_in? and (current_user == @farm.farmer) or current_user.admin?
      if @farm.update(farm_params)
        flash[:success] = "Your farm profile was updated."
        redirect_to farm_path(@farm)
      else
        render :edit
      end
    else
      redirect_to farm_path(@farm) 
    end
  end

  
  private
  
  def farm_params
    params.require(:farm).permit(:name, :address, :description, :email, :phone, :website, :price, :region_id, :photo)
  end
end
