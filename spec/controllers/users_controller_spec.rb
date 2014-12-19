require 'spec_helper' 

describe UsersController do
  describe "GET new" do
    it "sets @user" do
      get :new
      assigns(:user).should be_new_record
    end
  end
  
  describe "POST create" do
    context "with valid input" do
      it "creates user record" do   
        unhappy = Fabricate(:user, email: "unhappy@sad.com")
        post :create
        expect(User.count).to eq(1)
      end
      it "redirects to home" do
        unhappy = Fabricate(:user, email: "unhappy@sad.com")
        post :create
        expect(response).to redirect_to root_path
      end
    end
    
    context "with invalid input" do
      before { post :create, user: {password: "password"} }
      it "does not create the user" do
        expect(User.count).to eq(0)
      end
      it "renders the :new template" do
        expect(response).to render_template :new
      end
      it "sets @user" do
        expect(assigns(:user)).to be_instance_of(User)
      end
    end
  end
end