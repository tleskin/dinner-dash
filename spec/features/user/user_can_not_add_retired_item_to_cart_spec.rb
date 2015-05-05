require "rails_helper"

RSpec.describe "Cart after checkout" do
  it "cart is cleared after checkout" do
    admin = create(:admin_user)
    item = create(:item, title: "item1")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_items_path

    click_link "item1"
    select "retired", from: "item[status]"

    visit item_path(item)
    click_link "item1"
    first(:button, "Add To Cart").click
    visit checkout_path
    expect(page).to have_content("item1")
    click_button "Checkout"
    click_button "Confirm Order"

    visit checkout_path
    expect(page).to_not have_content("item1")
  end
