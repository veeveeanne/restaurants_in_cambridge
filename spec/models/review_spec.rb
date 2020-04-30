require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should belong_to(:restaurant) }
  it { should belong_to(:user) }
  it { should have_many(:votes) }
  it { should validate_presence_of(:overall) }
  it { should validate_presence_of(:body) }

  it do
    should validate_numericality_of(:overall).
      only_integer.
      is_greater_than_or_equal_to(1).
      is_less_than_or_equal_to(5)
  end

  it do
    should validate_numericality_of(:food).
      only_integer.
      allow_nil.
      is_greater_than_or_equal_to(1).
      is_less_than_or_equal_to(5)
  end

  it do
    should validate_numericality_of(:price).
      only_integer.
      allow_nil.
      is_greater_than_or_equal_to(1).
      is_less_than_or_equal_to(5)
  end

  it do
    should validate_numericality_of(:ambience).
      only_integer.
      allow_nil.
      is_greater_than_or_equal_to(1).
      is_less_than_or_equal_to(5)
  end

  it do
    should validate_numericality_of(:service).
      only_integer.
      allow_nil.
      is_greater_than_or_equal_to(1).
      is_less_than_or_equal_to(5)
  end

  describe "#user_screen_name" do
    it "returns the screen name of the user who created the review" do
      user = FactoryBot.create(:user)
      restaurant =  Restaurant.create(name: "Mr. Bartley", address: "1245 Massachusetts Ave", city: "Cambridge", state: "MA", zip: "02138", picture_url: "http://www.bu.edu/files/2012/02/h_12-4650-MRBBURGER-012.jpg")
      review = Review.create(overall: 5, food: 5, service: 5, price: 4, ambience: 4, body: "The food and service were all wonderful. Loved the ambience too!", restaurant: restaurant, user: user)

      expect(review.user_screen_name).to eq user.screen_name
    end
  end

  describe "#formatted_date" do
    it "returns a formatted date of created review" do
      user = FactoryBot.create(:user)
      restaurant =  Restaurant.create(name: "Mr. Bartley", address: "1245 Massachusetts Ave", city: "Cambridge", state: "MA", zip: "02138", picture_url: "http://www.bu.edu/files/2012/02/h_12-4650-MRBBURGER-012.jpg")
      review = Review.create(overall: 5, food: 5, service: 5, price: 4, ambience: 4, body: "The food and service were all wonderful. Loved the ambience too!", restaurant: restaurant, user: user)

      expect(review.formatted_date).to eq review.created_at.strftime("%-m/%-d/%Y")
    end
  end

  describe ".reviews_of_restaurant" do
    it "returns the reviews for a given restaurant" do
      user = FactoryBot.create(:user)
      restaurant =  Restaurant.create(name: "Mr. Bartley", address: "1245 Massachusetts Ave", city: "Cambridge", state: "MA", zip: "02138", picture_url: "http://www.bu.edu/files/2012/02/h_12-4650-MRBBURGER-012.jpg")
      review = Review.create(overall: 5, food: 5, service: 5, price: 4, ambience: 4, body: "The food and service were all wonderful. Loved the ambience too!", restaurant: restaurant, user: user)

      expect(Review.reviews_of_restaurant(restaurant.id).length).to eq 1
      expect(Review.reviews_of_restaurant(restaurant.id)[0]).to eq review
    end
  end

  describe "#total_votes" do
    it "returns the count of helpful votes for a review" do
      user = FactoryBot.create(:user)
      restaurant =  Restaurant.create(name: "Mr. Bartley", address: "1245 Massachusetts Ave", city: "Cambridge", state: "MA", zip: "02138", picture_url: "http://www.bu.edu/files/2012/02/h_12-4650-MRBBURGER-012.jpg")
      review = Review.create(overall: 5, food: 5, service: 5, price: 4, ambience: 4, body: "The food and service were all wonderful. Loved the ambience too!", restaurant: restaurant, user: user)
      vote1 = Vote.create(review: review, user: user, helpful: 1)
      vote2 = Vote.create(review: review, user: user, helpful: 0)

      expect(review.total_votes).to eq 1
    end
  end
end
