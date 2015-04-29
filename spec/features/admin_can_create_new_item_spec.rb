require "rails_helper"

RSpec.describe "Admin items" do

  context "as an admin" do
    it "can create a new item" do
      admin = create(:admin_user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path
      click_link "Add New Item"

      expect(current_path).to eq(new_admin_item_path)

      fill_in "Item title", with: "New Item"
      fill_in "Item description", with: "New Description"
      fill_in "Price", with: 500
      click_button "Submit Item"

      expect(page).to have_content("New Item")
      expect(page).to have_content("New Description")
      expect(page).to have_content(5)
      visit admin_items_path

      expect(page).to have_content("New Item")
    end
  end
end
