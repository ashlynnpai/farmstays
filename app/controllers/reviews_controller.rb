class ReviewsController < ApplicationController
  #before_filter :require_user

  def create
    @farm = Farm.find(params[:farm_id])
    review = @farm.reviews.build(params.require(:review).permit(:content).merge!(user: current_user))
    
    if review.save
      flash[:notice] = "Thank you for your review."
      redirect_to farm_path(@farm)
    else
      @reviews = @farm.reviews.reload
      render 'farms/show'
    end
  end
  
end