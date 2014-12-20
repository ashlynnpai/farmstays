require 'spec_helper' 

describe ReviewsController do
  describe "POST create" do
    let(:farm) { Fabricate(:farm) }
    context "with authenticated users" do
      let(:current_user) { Fabricate(:user) }
      before { session[:user_id] = current_user.id }
    end
      
      context "with valid input" do
        before do
          post :create, review: Fabricate.attributes_for(:review), farm_id: farm.id
        end
        it "redirects to show farm" do         
          expect(response).to redirect_to farm_path(farm)
        end
      end
   end 
end