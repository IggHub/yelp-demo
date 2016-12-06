require 'rails_helper'

describe User do
  it "has valid factory" do
    expect(build(:user)).to be_valid
  end

  before :each do
    @iggy = User.create(
      first_name: "Iggy",
      last_name: "test",
      email: "iggytest@email.com",
      password: "password"
    )
  end
  
  describe 'has valid first name, last name, and email' do
    it "has valid attributes" do
      expect(@iggy).to be_valid
    end
  end

  describe "has invalid first name, last name, and email" do
    it "has invalid first name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "has invalid last name" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "has invalid email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "has invalid password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
  end
end
