require "rails_helper"

RSpec.describe "admin page" do
 it "shows the status selected" do
   visit admin_orders_dashboard_path
   select("cancelled", from: "order[status]")
   expect(page).to have_content("burger")
 end
end
