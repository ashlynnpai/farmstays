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
  
  describe "#search_farms" do
    it "returns an array of one farm for an exact word match" do
       llama = Farm.create(name: "Llama Land Farm", address: "Llama Valley, Peru", description: "We offer a llama farm full of friendly llamas to pet.  We also have a store where we sell crafts.  We don't offer accommodation but we can recommend some guesthouses nearby. Photo by Thomas Quine, CC by 2.0.", email: "llamas@fake.com", phone: "0000", website: "llamaland.fake", price: 30, photo: "llama.jpg", region_id: 3)
      expect(Farm.search_farms("llama")).to eq([llama])
    end
    
    it "returns an array of two farms for a partial match" do
       llama = Farm.create(name: "Llama Land Farm", address: "Llama Valley, Peru", description: "We offer a llama farm full of friendly llamas to pet.  We also have a store where we sell crafts.  We don't offer accommodation but we can recommend some guesthouses nearby. Photo by Thomas Quine, CC by 2.0.", email: "llamas@fake.com", phone: "0000", website: "llamaland.fake", price: 30, photo: "llama.jpg", region_id: 3)
       tibet = Farm.create(name: "Dalai Lama Retreat", address: "Llama Valley, Peru", description: "We offer a llama farm full of friendly llamas to pet.  We also have a store where we sell crafts.  We don't offer accommodation but we can recommend some guesthouses nearby. Photo by Thomas Quine, CC by 2.0.", email: "llamas@fake.com", phone: "0000", website: "llamaland.fake", price: 30, photo: "llama.jpg", region_id: 3)
      expect(Farm.search_farms("lama").length).to eq(2)
    end
    
     it "returns case-insensitive results" do
       llama = Farm.create(name: "Llama Land Farm", address: "Llama Valley, Peru", description: "We offer a llama farm full of friendly llamas to pet.  We also have a store where we sell crafts.  We don't offer accommodation but we can recommend some guesthouses nearby. Photo by Thomas Quine, CC by 2.0.", email: "llamas@fake.com", phone: "0000", website: "llamaland.fake", price: 30, photo: "llama.jpg", region_id: 3)
       expect(Farm.search_farms("peru")).to eq([llama])
    end
  end
  
end
  