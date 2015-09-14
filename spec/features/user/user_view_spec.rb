require "rails_helper"

RSpec.describe "User view" do
  context 'with valid attributes' do
    
    it 'can create a new user' do
      visit new_user_path

      fill_in "Name", with: "David"
      fill_in "Username", with: "davy"
      fill_in "Email", with: "david@gmail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Create User"

      expect(page).to have_content("davy")
    end

  end
end