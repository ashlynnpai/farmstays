require 'spec_helper' 

describe FarmsController do
       
  describe "GET show" do  
    farm = Fabricate(:farm)
    it "sets @farm variable" do
        get :show, id: farm.id
        expect(assigns(:farm)).to eq(farm)
    end      
  end
    
end