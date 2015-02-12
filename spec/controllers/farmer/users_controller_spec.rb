require 'spec_helper'

describe Farmer::UsersController do
  describe 'dashboard' do
    context 'with valid farmer authentication' do
      let(:farmer) { Fabricate(:farmer) }
      before { session[:user_id] = farmer.id }
      it "sets @farmer variable" do      
        get :dashboard, id: farmer.slug
        expect(assigns(:farmer)).to eq(farmer)
      end
      it "renders the template dashboard" do
        get :dashboard, id: farmer.slug
        expect(response).to render_template :dashboard
      end
      it "redirects to root path for an invalid slug" do
        get :dashboard, id: "bad-slug"
        expect(response).to redirect_to root_path
      end  
    end
    context 'with invalid authentication' do
      it "redirects to root path where user is not a farmer" do
        user = Fabricate(:user, farmer: nil)
        session[:user_id] = user.id
        farmer = Fabricate(:farmer)
        get :dashboard, id: farmer.slug
        expect(response).to redirect_to root_path
      end
      it "redirects to root path where user is not the same farmer" do
        farmer1 = Fabricate(:farmer)
        session[:user_id] = farmer1.id
        farmer2 = Fabricate(:farmer)
        get :dashboard, id: farmer2.slug
        expect(response).to redirect_to root_path
      end
    end
  end
  

end