require 'rails_helper'

RSpec.describe 'user authentication' do
  context 'a registered user' do
    let!(:user) {User.create(name: 'John Doe',
                             username: 'JDoe',
                             email: 'jdoe@example.com',
                             password: 'password')}

    it 'can login' do
      visit login_path

      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      click_button "Submit"

      expect(current_path).to eq(user_path)
      expect(page).to have_content("#{user.username} Dashboard")
    end
  end
end
