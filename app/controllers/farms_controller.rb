class FarmsController < ApplicationController
  def index
    @farms = Farm.all
  end
  
  def show
    @farm = Farm.find(params[:id])
  end
  
   private
  
   def post_params
     params.require(:farm).permit(:name, :address, :description, :email, :phone, :website)
  end
end
