require 'rails_helper'

RSpec.describe 'user authentication' do
  context 'a registered user' do
    let!(:user) {User.create(name: 'John Doe',
                             username: 'JDoe',
                             email: 'jdoe@example.com',
                             password: 'password')}

    it 'can login' do
      visit login_path

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Submit"

      expect(current_path).to eq(user_path)
      expect(page).to have_content("#{user.name} Dashboard")
    end
  end

  context 'an unregistered user' do
    it 'can not login' do
      visit login_path

      fill_in "Email", with: "FakeEmail@example.com"
      fill_in "Password", with: "password"
      click_button "Submit"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid Credentials. Please Try Again.")
    end
  end
end
