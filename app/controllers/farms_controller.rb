class FarmsController < ApplicationController
  def index
    @farms = Farm.all
  end
  
  def show
    @farm = Farm.find(params[:id])
    @reviews = @farm.reviews
    @review = Review.new
  end
  
  def search
    @results = Farm.search_farms(params[:term])
  end
 
   private
  
   def post_params
     params.require(:farm).permit(:name, :address, :description, :email, :phone, :website)
  end
end
