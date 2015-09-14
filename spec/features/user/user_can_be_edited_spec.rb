require "rails_helper"

RSpec.describe "User view" do
  context 'with valid attributes' do

    it 'can edit a user' do
      user = create(:default_user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)
      click_link_or_button "Edit Profile"
      fill_in "Name", with: "David"
      fill_in "Username", with: "davy"
      fill_in "Email", with: "david@gmail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Update User"

      expect(page).to have_content("davy")
    end

    it 'cannot bed edit with empty name' do
      user = create(:default_user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)
      click_link_or_button "Edit Profile"
      fill_in "Name", with: ""
      fill_in "Username", with: "davy"
      fill_in "Email", with: "david@gmail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Update User"

      expect(page).to have_content("Name is too short")
    end

    it 'change user name to name that exist' do
      user = create(:default_user)

      visit new_user_path
      fill_in "Name", with: "David"
      fill_in "Username", with: "davy"
      fill_in "Email", with: "david@gmail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Create User"
 
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit user_path(user)
      click_link_or_button "Edit Profile"
      fill_in "Name", with: "David"
      fill_in "Username", with: "davy"
      fill_in "Email", with: "hi@gmail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Update User"

      expect(page).to have_content("Username has already been taken")
    end  

     it 'change user name to email that exist' do
      user = create(:default_user)

      visit new_user_path
      fill_in "Name", with: "David"
      fill_in "Username", with: "davy"
      fill_in "Email", with: "david@gmail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Create User"
 
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit user_path(user)
      click_link_or_button "Edit Profile"
      fill_in "Name", with: "mike"
      fill_in "Username", with: "boom"
      fill_in "Email", with: "david@gmail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Update User"

      expect(page).to have_content("Email has already been taken")
    end
  end
end