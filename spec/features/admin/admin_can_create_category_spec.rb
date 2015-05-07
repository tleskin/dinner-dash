require "rails_helper"

RSpec.describe "admin can create categories" do
  context "with admin logged in" do
    it "can create a new category" do
      admin = create(:admin_user)
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(admin)

      visit admin_categories_path
      click_button "Create Category"

      expect(current_path).to eq(new_admin_category_path)

      fill_in "Name", with: "vegan"
      fill_in "Description", with: "rabbit food"
      click_button "Create Category"
      expect(page).to have_content("vegan")
    end

    it "can create new categories" do
      admin = create(:admin_user)
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(admin)

      visit admin_categories_path
      click_button "Create Category"
      fill_in "Name", with: "MEAT"
      fill_in "Description", with: "RAW"
      click_button "Create Category"

      visit admin_categories_path
      click_button "Create Category"
      fill_in "Name", with: "vegan"
      fill_in "Description", with: "rabbit food"
      within(".")
      click_button "Create Category"
      expect(page).to have_content("vegan")
      expect(page).to have_content("MEAT")
    end
  end

end
