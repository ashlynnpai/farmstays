require 'spec_helper'

describe Farm do
  it { should validate_presence_of(:name)}  
  it { should validate_presence_of(:address)}  
  it { should validate_presence_of(:description)}  
  it { should have_many(:reviews)}
  it { should belong_to(:region) }
  
  
  describe "#latest_farms" do
     it "returns all farms if less than 4" do     
       sheep = Farm.create(name: "Sheep Shelter", address: "Old Sheep Road, Yorkshire, England", description: "We have lots of sheep here.", email: "sheep@fake.com", phone: "0000", website: "sheepshelter.fake")
       pony = Farm.create(name: "Pony Paradise", address: "Ponies Path, Snæfellsjökull, Iceland", description: "Our ponies are pretty.", email: "pony@fake.com", phone: "0000", website: "prettypony.fake")
       expect(Farm.latest_farms).to eq([pony, sheep])
    end

    it "returns 3 farms if more than three exist" do
       Fabricate.times(7, :farm) 
       expect(Farm.latest_farms.count).to eq(3)
    end
    
    it "returns the latest created" do
       sheep = Farm.create(name: "Sheep Shelter", address: "Old Sheep Road, Yorkshire, England", description: "We have lots of sheep here.", email: "sheep@fake.com", phone: "0000", website: "sheepshelter.fake", created_at: "2000-12-18 21:04:43.615863")
       Fabricate.times(7, :farm) 
       expect(Farm.latest_farms).not_to include(sheep) 
    end
  end
end
  