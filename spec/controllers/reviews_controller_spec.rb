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
        it "sets the flash success message" do
          expect(flash[:success]).not_to be_blank
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
  
  describe "GET edit" do
    context "with the user's own review" do
      before do
        @reviewer = Fabricate(:user)
        session[:user_id] = @reviewer.id
      end
        it "retrieves @review" do
          farm = Fabricate(:farm)
          review = Fabricate(:review, farm_id: farm.id, user_id: @reviewer.id)
          get :edit, farm_id: farm.id, id: review.id
          expect(assigns(:review)).to eq(review)
        end       
     end
    
    context "with another user's review" do
      before do
        @reviewer = Fabricate(:user)
        @reader = Fabricate(:user)
        session[:user_id] = @reader.id
      end
        it "redirects to farm path" do
          farm = Fabricate(:farm)
          review = Fabricate(:review, farm_id: farm.id, user_id: @reviewer.id)
          get :edit, farm_id: farm.id, id: review.id
          expect(response).to redirect_to farm_path(farm)
        end       
     end
  end
    
  describe "PUT update" do
    context "with the user's own review" do
      let(:current_user) { Fabricate(:user) }
      before { session[:user_id] = current_user.id }
      it "updates the review" do
        farm = Fabricate(:farm)
        review = Fabricate(:review, farm_id: farm.id, content: "old review", user_id: current_user.id)
        put :update, farm_id: farm.id, id: review.id, review: {content: "new review"}
        expect(review.reload.content).to eq("new review")
      end   
      it "sets the flash success message" do
        farm = Fabricate(:farm)
        review = Fabricate(:review, farm_id: farm.id, content: "old review", user_id: current_user.id)
        put :update, farm_id: farm.id, id: review.id, review: {content: "new review"}
        expect(flash[:success]).not_to be_blank
      end
    end
  end
end

   
