require 'spec_helper' 

describe RegionsController do
  describe "GET show" do
      it "sets @region variable" do
        region = Region.create(name: "Antartica")
        get :show, id: region.id
        expect(assigns(:region)).to eq(region)
    end  
  end
  
end