class ReviewsController < ApplicationController
  before_action :require_user
 # before_action :require_same_user, only: [:update]

  def create
    @farm = Farm.find(params[:farm_id])
    @review = @farm.reviews.build(params.require(:review).permit(:content))
    @review.creator = current_user
    if @review.save
      flash[:success] = "Thank you for your review."
      redirect_to farm_path(@farm)
    else
      @reviews = @farm.reviews.reload
      render 'farms/show'
    end
  end
  
  def edit
    @review = Review.find(params[:id])
    @farm = @review.farm
    require_same_user
  end
  
  def update   
    @review = Review.find(params[:id])
    @farm = @review.farm
    require_same_user
  
    if @review.update(review_params)
      flash[:success] = "The review was updated"
      redirect_to farm_path(@farm)
    else
      render :edit
    end
  end
 
  private
  
  def require_same_user
    redirect_to farm_path(@farm) unless logged_in? and (current_user == @review.creator)
  end
    
  def review_params
    params.require(:review).permit(:content)
  end
end
