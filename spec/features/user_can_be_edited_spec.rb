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
      save_and_open_page
    end

  end
end