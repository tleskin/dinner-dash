# require "rails_helper"
#
# RSpec.describe "Admin items" do
#   context "retire item" do
#     it "can retire an item" do
#       admin = create(:admin_user)
#       user = create(:default_user)
#
#       5.times do |x|
#         create(:item, title: "Item#{x}")
#       end
#
#       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
#
#       visit admin_items_path
#       click_link "Item1"
#       click_button "Retire Item"
#
#       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
#-
#       visit items_path
#
#       expect(page).to have_content("Item0")
#       expect(page).not_to have_content("Item1")
#       expect(page).to have_content("Item2")
#     end
#   end
# end
