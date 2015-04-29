require 'rails_helper'

RSpec.describe "site root" do
  context "as a user" do
    it "loads homepage when visiting root" do
      visit root_path

      expect(page).to have_content("Welcome to Hipster Bytes")
    end
  end
end
