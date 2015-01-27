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
end