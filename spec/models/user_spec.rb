require 'rails_helper'

  describe User do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:password)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:username)}
    it {should validate_length_of(:name).is_at_least(2).is_at_most(32)}
  end
