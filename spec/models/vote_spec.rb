require 'rails_helper'

RSpec.describe Vote, type: :model do
  it { should belong_to(:review) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:helpful) }

  it do 
    should validate_numericality_of(:helpful).
      only_integer.
      is_less_than_or_equal_to(1).
      is_greater_than_or_equal_to(0)
  end

  describe ".by_current_user" do
    it "should return an array of the votes that are by the current user" do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      restaurant =  Restaurant.create(name: "Mr. Bartley", address: "1245 Massachusetts Ave", city: "Cambridge", state: "MA", zip: "02138", picture_url: "http://www.bu.edu/files/2012/02/h_12-4650-MRBBURGER-012.jpg")
      review = Review.create(overall: 5, food: 5, service: 5, price: 4, ambience: 4, body: "The food and service were all wonderful. Loved the ambience too!", restaurant: restaurant, user: user1)
      vote1 = Vote.create(review: review, user: user1, helpful: 1)
      vote2 = Vote.create(review: review, user: user2, helpful: 1)

      expect(Vote.by_current_user(user1).length).to eq 1
      expect(Vote.by_current_user(user1)[0].id).to eq vote1.id
      expect(Vote.by_current_user(user1)[0].review).to eq vote1.review
      expect(Vote.by_current_user(user1)[0].helpful).to eq vote1.helpful
      expect(Vote.by_current_user(user1)[0].id).to_not eq vote2.id
    end
  end
end