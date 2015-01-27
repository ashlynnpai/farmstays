class Farmer::FarmsController < FarmersController
  before_filter :require_user
  before_filter :require_farmer
  
  def new
    @farm = Farm. new
  end    
end