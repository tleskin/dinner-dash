require "rails_helper"
  
RSpec.describe "admin can update categories" do
  it "can update a category" do
    admin = create(:admin_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    category = create(:category)
    visit admin_categories_path
    click_link_or_button "main course" 
    click_button "Edit Category"
    fill_in "Name", with: "Appetizer"
    fill_in "Description", with: "before main course"
    click_button "Update Category"

    expect(page).to have_content("Appetizer")
  end
  
end