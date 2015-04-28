require 'rails_helper'

RSpec.describe "Admin login" do
  context "with valid attributes" do
    it "is taken to admin dashboard" do
      admin = create(:admin_user)

      visit login_path
      fill_in "Username", with: "JaneDoe"
      fill_in "Password", with: "password"
      click_button "Submit"
      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content("Admin Dashboard - JaneDoe")
    end
  end

  context "with valid default user attributes" do
    it "is not taken to admin dashboard" do
      user = create(:default_user)

      visit login_path
      fill_in "Username", with: "JDoe"
      fill_in "Password", with: "password"
      click_button "Submit"

      expect(current_path).not_to eq(admin_dashboard_path)
      visit admin_dashboard_path

      expect(page).to have_content("404")
    end
  end
end
