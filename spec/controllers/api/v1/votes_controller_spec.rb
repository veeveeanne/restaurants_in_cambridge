require "rails_helper"

RSpec.describe Api::V1::VotesController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let!(:restaurant) { Restaurant.create(name: "Mr. Bartley", address: "1245 Massachusetts Ave", city: "Cambridge", state: "MA", zip: "02138", picture_url: "http://www.bu.edu/files/2012/02/h_12-4650-MRBBURGER-012.jpg") }
  let!(:review) { Review.create(overall: 5, food: 5, service: 5, price: 4, ambience: 4, body: "The food and service were all wonderful. Loved the ambience too!", restaurant: restaurant, user: user) }
  let!(:vote1) { Vote.create(review: review, user: user, helpful: 1) }
  let!(:vote2) { Vote.create(review: review, user: user, helpful: 0) }

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
      expect(response_body["vote"]["review_id"]).to eq new_vote_hash[:review_id]
      expect(response_body["vote"]["user_id"]).to eq new_vote_hash[:user_id]
      expect(response_body["vote"]["helpful"]).to eq new_vote_hash[:helpful]
      expect(response_body["reviews"]["reviews"].length).to eq 1
      expect(response_body["reviews"]["reviews"][0]["id"]).to eq review.id
    end
  end

  describe "PATCH#update" do
    it "does not change the number of votes in the database" do
      sign_in user
      previous_count = Vote.count
      patch :update, params: {id: vote1.id, review_id: vote1.review.id, helpful: 0}
      new_count = Vote.count

      expect(previous_count).to eq new_count
    end
    
    it "changes the helpful property of the vote in the database" do
      sign_in user
      previous_helpful_value = vote1.helpful 
      patch :update, params: {id: vote1.id, review_id: vote1.review.id, helpful: 0}
      updated_helpful_value = Vote.find(vote1.id)["helpful"]

      expect(previous_helpful_value).to_not eq updated_helpful_value
      expect(updated_helpful_value).to eq 0
    end

    it "returns the updated list of votes by the current user and list of reviews as json" do
      sign_in user
      patch :update, params: {id: vote1.id, review_id: vote1.review.id, helpful: 0}

      response_body = JSON.parse(response.body)

      expect(response_body.length).to eq 2
      expect(response_body["votes"].length).to eq 2
      expect(response_body["votes"][0]["id"]).to eq vote1.id
      expect(response_body["votes"][0]["review_id"]).to eq vote1.review_id
      expect(response_body["votes"][0]["user_id"]).to eq vote1.user_id
      expect(response_body["votes"][0]["helpful"]).to_not eq vote1.helpful
      expect(response_body["votes"][1]["id"]).to eq vote2.id
      expect(response_body["votes"][1]["review_id"]).to eq vote2.review_id
      expect(response_body["votes"][1]["user_id"]).to eq vote2.user_id
      expect(response_body["votes"][1]["helpful"]).to eq vote2.helpful
      expect(response_body["reviews"]["reviews"].length).to eq 1
      expect(response_body["reviews"]["reviews"][0]["id"]).to eq review.id 
    end
  end

  describe "DELETE#destroy" do
    it "removes the specified vote from the database" do
      sign_in user
      previous_count = Vote.count
      delete :destroy, params: {id: vote1.id, review_id: vote1.review.id}
      new_count = Vote.count

      expect(new_count).to eq (previous_count - 1)
    end
    
    it "returns the updated list of votes by the current user and the updated list of reviews as json" do
      sign_in user
      delete :destroy, params: {id: vote1.id, review_id: vote1.review.id}

      response_body = JSON.parse(response.body)

      expect(response_body.length).to eq 2
      expect(response_body["votes"].length).to eq 1
      expect(response_body["votes"][0]["id"]).to eq vote2.id
      expect(response_body["votes"][0]["review_id"]).to eq vote2.review_id
      expect(response_body["votes"][0]["user_id"]).to eq vote2.user_id
      expect(response_body["votes"][0]["helpful"]).to eq vote2.helpful
      expect(response_body["reviews"]["reviews"].length).to eq 1
      expect(response_body["reviews"]["reviews"][0]["id"]).to eq review.id
    end
  end
end