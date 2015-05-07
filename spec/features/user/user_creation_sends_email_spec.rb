require 'rails_helper'

RSpec.describe UserNotifier do
  context "unauthenticated user creates an account" do
    it "sends an email to confirm new user" do
      visit new_user_path

      fill_in "Name", with: "Auden Zane"
      fill_in "Username", with: "az"
      fill_in "Email", with: "hipsterbites@gmail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Create User"

      expect(current_path).to eq(user_path)
      expect(ActionMailer::Base.deliveries.length).to eq(15)

      visit new_user_path

      fill_in "Name", with: "Kenny Chen"
      fill_in "Username", with: "kenny"
      fill_in "Email", with: "hipsterkenny@gmail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Create User"

      expect(current_path).to eq(user_path)
      expect(ActionMailer::Base.deliveries.length).to eq(16)
    end

    it "doesn't send an email if missing fields" do
      visit new_user_path

      fill_in "Name", with: "Kenny Chen"
      fill_in "Username", with: "kenny"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Create User"

      expect(ActionMailer::Base.deliveries.length).to eq(16)
    end
  end
end
