require 'spec_helper' 

describe FarmsController do

  describe "GET index" do
    it "sets @farms variable" do
      Fabricate.times(10, :farm) 
      get :index
      expect(Farm.count).to eq(10)
    end
  end
  
  describe "GET show" do  
    it "sets @farm variable" do
      farm = Fabricate(:farm)
      get :show, id: farm.slug
      expect(assigns(:farm)).to eq(farm)
    end
    it "renders the template show" do
      farm = Fabricate(:farm)
      get :show, id: farm.slug
      expect(response).to render_template :show
    end 
  end
end