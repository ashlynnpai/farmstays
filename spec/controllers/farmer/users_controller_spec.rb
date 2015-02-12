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
      let(:user) { Fabricate(:user, farmer: nil) }
      before { session[:user_id] = user.id }
      it "redirects to root path" do
        farmer = Fabricate(:farmer)
        get :dashboard, id: farmer.slug
        expect(response).to redirect_to root_path
      end
    end
  end
  

end