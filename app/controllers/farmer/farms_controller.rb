class Farmer::FarmsController < FarmersController
  before_filter :require_user
  before_filter :require_farmer
  
  def new
    @farm = Farm. new
  end    
  
  def create
    @farm = Farm.create(farm_params)
    
    if @farm.save
      redirect_to farm_path(@farm)
    else
      render :new
    end
  end
  
  private
  
  def farm_params
    params.require(:farm).permit(:name, :address, :description, :email, :phone, :website, :price, :region_id, :photo)
  end
end
