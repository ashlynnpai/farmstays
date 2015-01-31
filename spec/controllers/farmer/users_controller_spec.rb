require 'spec_helper'

describe Farmer::UsersController do
  describe 'dashboard' do
    it "sets @farmer variable" do      
      farmer = Fabricate(:farmer)
      session[:user_id] = farmer.id
      get :dashboard, id: farmer.id
      expect(assigns(:farmer)).to eq(farmer)
    end
  end  
end