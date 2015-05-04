require "rails_helper"

RSpec.describe "admin can delete categories" do
  it "can delete a category" do
    admin = create(:admin_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    category = create(:category)
    visit admin_category_path(category)
    click_link_or_button "Delete Category"

    expect(current_path).to eq(admin_categories_path)
    save_and_open_page
    expect(page).not_to have_content("main course")
  end

end
