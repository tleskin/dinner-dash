require "rails_helper"

RSpec.describe "Admin Items" do
  context "edit item" do
    it "can edit an item" do
      5.times do |x|
        create(:item, title: "Item#{x}")
      end

      admin = create(:admin_user)
      allow_any_instance_of(ApplicationController).to receive(:current_user)
                                                  .and_return(admin)

      visit admin_dashboard_path
      click_link "All Items"

      expect(current_path).to eq(admin_items_path)

      click_link "Item1"
      click_link "Edit"

      fill_in "Item title", with: "Edited Item"
      fill_in "Item description", with: "Edited Description"
      fill_in "Price", with: 600
      click_button "Create Item"

      expect(page).to have_content("Edited Item")
      expect(page).to have_content("Edited Description")
      expect(page).to have_content(6)
    end
  end
end
