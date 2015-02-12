class FarmsController < ApplicationController
  def index
    @farms = Farm.all
  end
  
  def show
    @farm = Farm.find_by slug: params[:id]
    if @farm == nil
      redirect_to root_path 
    else
      @reviews = @farm.reviews
      @review = Review.new
    end
  end
  
  def search
    @results = Farm.search_farms(params[:term])
  end
 
   private
  
   def post_params
     params.require(:farm).permit(:name, :address, :description, :email, :phone, :website)
  end
end
