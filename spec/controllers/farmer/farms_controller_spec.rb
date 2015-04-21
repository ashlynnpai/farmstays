require 'spec_helper'

describe Farmer::FarmsController do
  describe 'GET new' do
    it_behaves_like "requires sign in" do
      let(:action) { get :new }
    end     
  
    context "logged in as a farmer" do
      it "sets @farm" do
        set_farmer
        get :new
        expect(assigns(:farm)).to be_instance_of Farm
      end
    end
    
    context "logged in as an admin" do
      it "sets @farm" do
        set_admin
        get :new
        expect(assigns(:farm)).to be_instance_of Farm
      end
    end
    
    context "not logged in as a farmer or admin" do
      let(:user) { Fabricate(:user, farmer: "nil") }
      before do
        session[:user_id]=user.id
      end
      it "redirects the unauthorized user to the root path" do
        get :new
        expect(response).to redirect_to root_path
      end
    end
  end 
  
  describe 'POST create' do
    it_behaves_like "requires sign in" do
      let(:action) { post :create }
    end

    context "with valid input and logged in as a farmer" do
      before do 
        set_farmer
        post :create, farm: Fabricate.attributes_for(:farm) 
      end
      it "creates farm record" do
        expect(Farm.count).to eq(1)
      end
      it "redirects to new farm show page" do
        farm = Farm.first
        expect(response).to redirect_to farm_path(farm)
      end
      it "sets the flash success message" do
        farm = Farm.first
        expect(flash[:success]).not_to be_blank
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
      it "redirects to new farm show page" do
        farm = Farm.first
        expect(response).to redirect_to farm_path(farm)
      end
      it "sets the flash success message" do
        farm = Farm.first
        expect(flash[:success]).not_to be_blank
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
        session[:user_id] = user.id
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
  
  describe "GET edit" do
    context "logged in as the farmer who owns the farm" do
      before do
        set_farmer
      end
      it "retrieves @farm" do
        farm = Fabricate(:farm)
        get :edit, id: farm.id
        expect(assigns(:farm)).to eq(farm)
      end    
    end
    
    context "not logged in as the farmer who owns the farm" do
      let(:farm_owner) { Fabricate(:farmer) }
      let(:current_farmer) { Fabricate(:farmer) }
      before do
        session[:user_id] = current_farmer.id
      end
      it "redirects the other farmer to the farm path" do
        farm = Fabricate(:farm, user_id: farm_owner.id)
        get :edit, id: farm.id
        expect(response).to redirect_to farm_path(farm)
      end      
    end
  end
  
  describe "PUT update" do
    context "with the farmer's own farm" do
      let(:farm_owner) { Fabricate(:farmer) }
      before do
        session[:user_id] = farm_owner.id
      end
      it "updates the farm profile" do
        farm = Fabricate(:farm, name: "old farm", user_id: farm_owner.id)
        put :update, id: farm.id, user_id: farm_owner.id, farm: { name: "new farm"}
        expect(farm.reload.name).to eq("new farm")
      end
      it "sets the flash success" do
        farm = Fabricate(:farm, name: "old farm", user_id: farm_owner.id)
        put :update, id: farm.id, user_id: farm_owner.id, farm: { name: "new farm"}
        expect(flash[:success]).not_to be_blank
      end
    end
    
    context "not logged in as the farmer who owns the farm" do
      let(:farm_owner) { Fabricate(:farmer) }
      let(:current_farmer) { Fabricate(:farmer) }
      before do
        session[:user_id] = current_farmer.id
      end
      it "redirects the other farmer to the farm path" do
        farm = Fabricate(:farm, name: "old farm", user_id: farm_owner.id)
        put :update, id: farm.id, user_id: farm_owner.id, farm: { name: "new farm"}
        expect(farm.reload.name).to eq("old farm")
      end      
    end
  end
end