require 'spec_helper' 

describe ReviewsController do
  describe "POST create" do
    let(:farm) { Fabricate(:farm) }
    context "with authenticated users" do
      let(:current_user) { Fabricate(:user) }
      before { session[:user_id] = current_user.id }
      
      context "with valid input" do
        before do
          post :create, review: Fabricate.attributes_for(:review), farm_id: farm.id
        end
        it "redirects to show farm" do         
          expect(response).to redirect_to farm_path(farm)
        end
        it "creates a review associated with the farm" do
          expect(Review.first.farm).to eq(farm)
        end
        it "creates a review associated with the signed in user" do
          expect(Review.first.creator).to eq(current_user)
        end
      end
    end
     context "with unauthenticated users" do
      it "redirects to sign in path" do
        post :create, review: Fabricate.attributes_for(:review), farm_id: farm.id
        expect(response).to redirect_to login_path
      end
    end   
  end 
end


      
   
