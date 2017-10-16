require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Passwords dont match" do
    it "passwords dont match" do
      user = User.new(email: "morgan@asdf.com", password: "password", password_confirmation: "notpassword")
      expect(user).to_not be_valid
    end
  end
  describe "Passwords do match" do
    it "passwords match" do
      user = User.new(email: "morgan@asdf.com", password: "password", password_confirmation: "password")
      expect(user).to be_valid
    end
  end

  describe "Unique Email" do
    describe User, 'validations' do
      it { should validate_uniqueness_of(:email).case_sensitive}

    end
  end
end
