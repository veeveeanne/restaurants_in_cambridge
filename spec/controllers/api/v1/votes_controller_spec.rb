require "rails_helper"

RSpec.describe Api::V1::VotesController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let!(:restaurant) { Restaurant.create(name: "Mr. Bartley", address: "1245 Massachusetts Ave", city: "Cambridge", state: "MA", zip: "02138", picture_url: "http://www.bu.edu/files/2012/02/h_12-4650-MRBBURGER-012.jpg") }
  let!(:review) { Review.create(overall: 5, food: 5, service: 5, price: 4, ambience: 4, body: "The food and service were all wonderful. Loved the ambience too!", restaurant: restaurant, user: user) }
  let!(:vote) { Vote.create(review: review, user: user, helpful: 1) }

  describe "POST#create" do
    let!(:new_vote_hash) { { review_id: review.id, user_id: user.id, helpful: 1 } }
    
    it "adds a new vote to the database" do
      sign_in user
      previous_count = Vote.count
      post :create, params: new_vote_hash, format: :json
      new_count = Vote.count

      expect(new_count).to eq (previous_count + 1)
    end

    it "returns the new vote and the updated list of reviews as json" do
      sign_in user
      post :create, params: new_vote_hash, format: :json

      response_body = JSON.parse(response.body)

      expect(response_body.length).to eq 2
      expect(response_body["vote"].length).to eq 6
      expect(response_body["vote"]["review_id"]).to eq vote.review_id
      expect(response_body["vote"]["user_id"]).to eq vote.user_id
      expect(response_body["vote"]["helpful"]).to eq vote.helpful
      expect(response_body["reviews"]["reviews"].length).to eq 1 
    end
  end

  describe "PATCH#update" do
    
  end

  describe "DELETE#destroy" do
    
  end
end