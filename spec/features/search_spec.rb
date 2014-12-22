require 'spec_helper'

feature "Searching" do

  scenario "Using the search form" do
    Farm.create(name: "Coffee Country Farm", address: "Arabica Road, Ethiopia", description: "Visit our beautiful coffee farm in the Abaya Highlands. We are       close to national parks and wildlife. We offer five bedrooms for guests and free samples of our coffee.  Photo by Rod Waddington, CC by SA 2.0.", email:       "coffee@fake.com", phone: "0000", website: "coffeecountry.fake", price: 30, photo: "coffee.jpg", region_id: 1)
    visit root_path
    fill_in 'Search Farms by keyword', :with => 'ethiopia'
    click_button 'Search'
    expect(page).to have_content 'Coffee'
  end
  
   scenario "Using the search form" do
    Farm.create(name: "Coffee Country Farm", address: "Arabica Road, Ethiopia", description: "Visit our beautiful coffee farm in the Abaya Highlands. We are       close to national parks and wildlife. We offer five bedrooms for guests and free samples of our coffee.  Photo by Rod Waddington, CC by SA 2.0.", email:       "coffee@fake.com", phone: "0000", website: "coffeecountry.fake", price: 30, photo: "coffee.jpg", region_id: 1)
    visit root_path
     fill_in 'Search Farms by keyword', :with => 'france'
    click_button 'Search'
    expect(page).not_to have_content 'Coffee'
  end 
end