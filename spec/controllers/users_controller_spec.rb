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
      before { post :create, user: Fabricate.attributes_for(:user) }
      it "creates user record" do
        expect(User.count).to eq(1)
      end
      it "redirects to home" do
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
  
  describe "GET show" do
    it "sets @user" do
      user = Fabricate(:user)
      get :show, id: user.slug
      expect(response).to be_success
    end
  end
  
  describe "GET show" do
    it "sets @user" do
      user = Fabricate(:user)
      get :show, id: user.slug
      expect(assigns(:user)).to eq(user)
    end
    it "renders the template show" do
      user = Fabricate(:user)
      get :show, id: user.slug
      expect(response).to render_template :show
    end
    it "redirects to root path for an invalid slug" do
      user = Fabricate(:user, slug: "good-slug")
      get :show, id: "bad-slug"
      expect(response).to redirect_to root_path
    end
    it "renders show for valid slug" do
      user = Fabricate(:user, slug: "good-slug")
      get :show, id: user.slug
      expect(response).to render_template :show
    end
  end
end
