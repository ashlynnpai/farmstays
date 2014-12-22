require 'spec_helper'

feature "Register" do

  scenario "Register with correct credentials" do
    visit register_path
    fill_in 'Email', :with => 'user1@email.com'
    fill_in 'Password', :with => 'password1' 
    fill_in 'Name', :with => 'Happy Hippo'
    click_button 'Register'
    expect(page).to have_content 'Happy Hippo'
  end
  
   scenario "Register with incorrect credentials" do
    visit register_path
    fill_in 'Email', :with => 'user1@email.com'
    fill_in 'Password', :with => 'pas' 
    fill_in 'Name', :with => 'Happy Hippo'
    click_button 'Register'
    expect(page).not_to have_content 'Happy Hippo'
  end
  
end