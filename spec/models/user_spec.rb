require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Password validation" do
    it { should validate_length_of(:password).is_at_least(6).on(:create)}
    it { should validate_presence_of(:password)}
    it { should validate_confirmation_of(:password)}
  end

  describe "Unique Email" do
    it { should validate_presence_of(:email)}
    it { should validate_uniqueness_of(:email).case_insensitive}
  end

  describe "First name && last name" do
    it { should validate_presence_of(:last_name)}
    it { should validate_presence_of(:first_name)}
  end

  describe '.authenticate_with_credentials' do
    describe do
    it "email with spaces" do
      user =  User.new(email: 'asdfasdf@asdf.com', password: 'asdfasdf', last_name: "asdf", first_name: "bob")
      user.save!
      login = User.authenticate_with_credentials(' AsDfaSdf@asdf.com ', 'asdfasdf')

      expect(login).to have_attributes(:email => 'asdfasdf@asdf.com')
    end
  end
 end

end
