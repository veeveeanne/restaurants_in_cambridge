require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do
  describe "GET#index" do
    let!(:user) { FactoryBot.create(:user) }
    let!(:restaurant1) { Restaurant.create(name: "Mr. Bartley", address: "1245 Massachusetts Ave", city: "Cambridge", state: "MA", zip: "02138", picture_url: "http://www.bu.edu/files/2012/02/h_12-4650-MRBBURGER-012.jpg") }
    let!(:review1) { Review.create(overall: 5, food: 5, service: 5, price: 4, ambience: 4, body: "The food and service were all wonderful. Loved the ambience too!", restaurant: restaurant1, user: user) }
    let!(:review2) { Review.create(overall: 4, food: 4, service: 3, price: 3, body: "Great burgers here. Came here for a dinner with friends and had a great time.", restaurant: restaurant1, user: user) }

    it "returns a successful response status and a content type of json" do
      get :index, params: { restaurant_id: restaurant1.id }

      expect(response.status).to eq 200
      expect(response.content_type).to eq "application/json"
    end

    it "returns reviews for a specific restaurant" do
      get :index, params: { restaurant_id: restaurant1.id }
      response_body = JSON.parse(response.body)
      
      expect(response_body).to have_key("reviews")
      
      reviews_array = response_body["reviews"]
      
      expect(reviews_array.length).to eq 2

      expect(reviews_array[0]["id"]).to eq review1.id
      expect(reviews_array[0]["user_screen_name"]).to eq user.screen_name
      expect(reviews_array[0]["formatted_date"]).to eq review1.created_at.strftime("%-m/%-d/%Y")
      expect(reviews_array[0]["overall"]).to eq review1.overall
      expect(reviews_array[0]["food"]).to eq review1.food
      expect(reviews_array[0]["service"]).to eq review1.service
      expect(reviews_array[0]["price"]).to eq review1.price
      expect(reviews_array[0]["ambience"]).to eq review1.ambience
      expect(reviews_array[0]["body"]).to eq review1.body

      expect(reviews_array[1]["id"]).to eq review2.id
      expect(reviews_array[1]["user_screen_name"]).to eq user.screen_name
      expect(reviews_array[1]["formatted_date"]).to eq review2.created_at.strftime("%-m/%-d/%Y")
      expect(reviews_array[1]["overall"]).to eq review2.overall
      expect(reviews_array[1]["food"]).to eq review2.food
      expect(reviews_array[1]["service"]).to eq review2.service
      expect(reviews_array[1]["price"]).to eq review2.price
      expect(reviews_array[1]["ambience"]).to eq review2.ambience
      expect(reviews_array[1]["body"]).to eq review2.body
    end
  end
end