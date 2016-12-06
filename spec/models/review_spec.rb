require 'rails_helper'

describe Review do
  it "has valid factory" do
    expect(build(:user)).to be_valid
  end

  describe "valid rating and comment" do
    context "valid rating and comment" do
      it "is valid with rating and comment" do
        user = create(:user)
        review = build(:review, user: user)
        review.valid?
        user.valid?
        expect(review).to be_valid
        expect(user).to be_valid
      end
    end

    context "invalid rating" do
      it "has rating outside of 1-5" do
        review = build(:review, rating: 7)
        review.valid?
        expect(review.errors[:rating]).to include("can only be whole numbers between/ including 1-5")
      end
    end

    context "valid rating" do
      it "has rating between 1-5" do
        review = build(:review, rating: 4, comment: "some comment")
        review.valid?
        expect(review).to be_valid
      end
    end
  end
end
