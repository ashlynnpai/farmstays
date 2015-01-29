require 'spec_helper'

describe Farmer::FarmsController do
  describe 'GET new' do
    it_behaves_like "requires sign in" do
      let(:action) { get :new }
    end    
  end  
  
  it "sets @farm" do
    set_farmer
    get :new
    expect(assigns(:farm)).to be_instance_of Farm
  end
  
  describe 'POST create' do
    it_behaves_like "requires sign in" do
      let(:action) { post :create }
    end
  end
  
  describe "POST create" do
    context "with valid input and logged in as a farmer" do
      before do 
        set_farmer
        post :create, farm: Fabricate.attributes_for(:farm) 
      end
      it "creates farm record" do
        expect(Farm.count).to eq(1)
      end
      it "redirects to new farm sho page" do
        farm = Farm.first
        expect(response).to redirect_to farm_path(farm)
      end
    end
    
    context "with valid input and logged in as admin" do
      before do 
        set_admin
        post :create, farm: Fabricate.attributes_for(:farm) 
      end
      it "creates farm record" do
        expect(Farm.count).to eq(1)
      end
      it "redirects to new farm sho page" do
        farm = Farm.first
        expect(response).to redirect_to farm_path(farm)
      end
    end
    
    context "with invalid input" do
      before do
        set_farmer
        post :create, farm: {name: "No Farm"} 
      end
      it "does not create the farm" do
        expect(Farm.count).to eq(0)
      end
      it "renders the :new template" do
        expect(response).to render_template :new
      end
      it "sets @farm" do
        expect(assigns(:farm)).to be_instance_of(Farm)
    end
    end
    
    context "not logged in as a farmer" do
      before do
        user = Fabricate(:user, farmer: "nil")
        session[:user_id]=user.id
        post :create, farm: Fabricate.attributes_for(:farm)  
      end
      it "does not create the farm" do
        expect(Farm.count).to eq(0)
      end
      it "redirects to the root path" do
        expect(response).to redirect_to root_path
      end
    end
  end
end