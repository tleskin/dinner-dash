require "rails_helper"

RSpec.describe "unauthorized user" do
  context "checkout" do

    it "can login and checkout" do
      5.times do |x|
        create(:item, title: "item#{x}")
      end

      visit items_path
      click_link "item1"
      first(:button, "Add To Cart").click

      visit checkout_path

      click_button "Checkout"
      expect(current_path).to eq(new_user_path)

      fill_in "Name", with: "David"
      fill_in "Username", with: "davy"
      fill_in "Email", with: "david@gmail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Create User"

      visit checkout_path

      click_button "Checkout"


      expect(page).to have_content("item1")
      expect(page).to have_content("Confirm Order")

      click_button "Confirm Order"

      expect(page).to have_content("Would you like to pay now?")

      click_button("No thanks, Ill pay later.")
      expect(page).to have_content("Dashboard")
    end
  end
end
