require "rails_helper"

RSpec.describe "User view" do
  context 'with valid attributes' do


    it 'can view order page' do
      user = create(:default_user)
      5.times do |x|
        create(:item, title: "item#{x}")
      end
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit items_path
      click_link "item1"
      first(:button, "Add To Cart").click
      visit checkout_path
      click_button "Checkout"
      click_button "Confirm Order"

      visit user_path(user)
      click_button "Orders"

      expect(page).to have_content("Orders")
    end

  end
end