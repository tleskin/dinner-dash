require "rails_helper"

RSpec.describe "Cart after checkout" do
  it "cart is cleared after checkout" do
      user = create(:default_user)
      5.times do |x|
        create(:item, title: "item#{x}")
      end
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit items_path
      click_link "item1"
      first(:button, "Add To Cart").click
      visit checkout_path
      expect(page).to have_content("item1")
      click_button "Checkout"
      click_button "Confirm Order"

      visit checkout_path
      expect(page).to_not have_content("item1")
  end
end