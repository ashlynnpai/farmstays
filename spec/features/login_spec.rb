require 'spec_helper'

feature "Signing in" do

  scenario "Signing in with correct credentials" do
    user1 = User.create(name: "Happy Hippo", password: "password1", email: "user1@email.com")
    visit login_path
    fill_in 'Email', :with => 'user1@email.com'
    fill_in 'Password', :with => 'password1' 
    click_button 'Sign in'
    expect(page).to have_content user1.name
  end

  scenario "Signing in with wrong credentials" do
    user1 = Fabricate(:user)
    visit login_path
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => "wrongway"
    click_button 'Sign in'
    expect(page).to have_content "There's something wrong with your username or password."
  end
end