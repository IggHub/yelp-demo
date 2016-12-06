require 'rails_helper'

describe Restaurant do
  describe "valid with name, phone, website, and address" do
    before :each do
      #@file = fixture_file_upload('files/dimsum.jpg', 'image/jpg')
      @dimsum = Restaurant.create(
        name: "Dim Sum",
        phone: "(123) 123-1234",
        website: "http://www.baodimsum.com/",
        address: "8256 Beverly Blvd, Los Angeles, CA 90048"
      )
      @krunchyKreme = Restaurant.create(
        name: "krunchy kreme",
        phone: "(123) 456-7890",
        website: "http://www.krispykreme.com/",
        address: "485 Mills Cir, Ontario, CA 91764"
      )
    end

    it "is valid with name, phone, website, and address" do
      expect(@dimsum).to_not be_valid
      expect(@krunchyKreme).to_not be_valid
    end
  end

  describe "tests name validity" do
    it "is invalid without a name" do
      restaurant = Restaurant.new(name: nil)
      restaurant.valid?
      expect(restaurant.errors[:name]).to include("can't be blank")
    end
  end
###how can I test duplicate? Do I need to test duplicates?###
=begin
  it "is invalid with duplicate names" do
    Restaurant.create(name: "Fresh")
    restaurant = Restaurant.new(name: "Fresh")
    restaurant.valid?
    expect(restaurant.errors[:name]).to include("has already been taken")
  end
=end
  describe "tests phone validity" do
    it "is invalid without a phone" do
      restaurant = Restaurant.new(phone: nil)
      restaurant.valid?
      expect(restaurant.errors[:phone]).to include("can't be blank")
    end

    it "must follows phone pattern" do
        restaurant = Restaurant.new(phone: "123-456-7890")
        restaurant.valid?
        expect(restaurant.errors[:phone]).to include("must be in the format (123) 456-7890")
    end
  end

  describe "tests website validity" do
    it "is invalid without a website" do
      restaurant = Restaurant.new(website: nil)
      restaurant.valid?
      expect(restaurant.errors[:website]).to include("can't be blank")
    end

    it "must follow website pattern" do
      restaurant = Restaurant.new(website: "somewebsite.com")
      restaurant.valid?
      expect(restaurant.errors[:website]).to include("must start with http:// or https://")
    end
  end

  describe "tests address validity" do
    it "is invalid without an address" do
      restaurant = Restaurant.new(address: nil)
      restaurant.valid?
      expect(restaurant.errors[:address]).to include("can't be blank")
    end

    it "must follow address pattern" do
      restaurant = Restaurant.new(address: "123 some street blablah, some state, 1234")
      restaurant.valid?
      expect(restaurant.errors[:address]).to include("must be in the format 350 Fifth Avenue, New York, NY 10118")
    end
  end
end
