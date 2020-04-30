require "rails_helper"

RSpec.describe Api::V1::RestaurantsController, type: :controller do
  describe "GET#index" do
    let!(:restaurant_one) { Restaurant.create(name: "Mr. Bartley", address: "1245 Massachusetts Ave", city: "Cambridge", state: "MA", zip: "02138", picture_url: "https://s3-media0.fl.yelpcdn.com/bphoto/UIDbWpmwnCBi9Hvp0QJOHw/o.jpg") }
    let!(:restaurant_two) { Restaurant.create(name: "Alden & Harlow", address: "40 Brattle Street", city: "Cambridge", state: "MA", zip: "02138", picture_url: "https://s3-media0.fl.yelpcdn.com/bphoto/iDdGFQoP3BZvk2QzIt3Z0A/o.jpg") }

    it "returns a successful response status and a content type of json" do
      get :index

      expect(response.status).to eq 200
      expect(response.content_type).to eq "application/json"
    end

    it "returns all restaurants in database" do
      get :index

      response_body = JSON.parse(response.body)

      expect(response_body.length).to eq 2

      expect(response_body[0]["name"]).to eq restaurant_one.name
      expect(response_body[0]["address"]).to eq restaurant_one.address
      expect(response_body[0]["city"]).to eq restaurant_one.city
      expect(response_body[0]["state"]).to eq restaurant_one.state
      expect(response_body[0]["zip"]).to eq restaurant_one.zip
      expect(response_body[0]["picture_url"]).to eq restaurant_one.picture_url

      expect(response_body[1]["name"]).to eq restaurant_two.name
      expect(response_body[1]["address"]).to eq restaurant_two.address
      expect(response_body[1]["city"]).to eq restaurant_two.city
      expect(response_body[1]["state"]).to eq restaurant_two.state
      expect(response_body[1]["zip"]).to eq restaurant_two.zip
      expect(response_body[1]["picture_url"]).to eq restaurant_two.picture_url
    end
  end

  describe "GET#show" do
    let!(:restaurant_one) { Restaurant.create(name: "Mr. Bartley", address: "1245 Massachusetts Ave", city: "Cambridge", state: "MA", zip: "02138", picture_url: "https://s3-media0.fl.yelpcdn.com/bphoto/UIDbWpmwnCBi9Hvp0QJOHw/o.jpg") }
    let!(:user_one) { User.create(email: "a1@b.com", screen_name: "User1234", password: "password") }
    let!(:review1) { Review.create(overall: 5, food: 5, service: 5, price: 4, ambience: 4, body: "The food and service were all wonderful. Loved the ambience too!", restaurant: restaurant_one, user: user_one) }
    let!(:review2) { Review.create(overall: 4, food: 4, service: 3, price: 3, body: "Great burgers here. Came here for a dinner with friends and had a great time.", restaurant: restaurant_one, user: user_one) }

    it "returns a successful response status and a content type of json" do
      get :show, params: {id: restaurant_one.id}

      expect(response.status).to eq 200
      expect(response.content_type).to eq "application/json"
    end

    it "returns a restaurant's information in the data base" do
      sign_in user_one
      get :show, params: {id: restaurant_one.id}

      response_body = JSON.parse(response.body)
      user_response = response_body["user"]
      restaurant_response = response_body["restaurant"]
      reviews_response = response_body["reviews"]["reviews"]

      expect(response_body.length).to equal 3

      expect(restaurant_response["name"]).to eq restaurant_one.name
      expect(restaurant_response["address"]).to eq restaurant_one.address
      expect(restaurant_response["city"]).to eq restaurant_one.city
      expect(restaurant_response["state"]).to eq restaurant_one.state
      expect(restaurant_response["zip"]).to eq restaurant_one.zip
      expect(restaurant_response["picture_url"]).to eq restaurant_one.picture_url

      expect(reviews_response[0]["id"]).to eq review1.id
      expect(reviews_response[0]["user_screen_name"]).to eq user_one.screen_name
      expect(reviews_response[0]["formatted_date"]).to eq review1.created_at.strftime("%-m/%-d/%Y")
      expect(reviews_response[0]["overall"]).to eq review1.overall
      expect(reviews_response[0]["food"]).to eq review1.food
      expect(reviews_response[0]["service"]).to eq review1.service
      expect(reviews_response[0]["price"]).to eq review1.price
      expect(reviews_response[0]["ambience"]).to eq review1.ambience
      expect(reviews_response[0]["body"]).to eq review1.body

      expect(reviews_response[1]["id"]).to eq review2.id
      expect(reviews_response[1]["user_screen_name"]).to eq user_one.screen_name
      expect(reviews_response[1]["formatted_date"]).to eq review2.created_at.strftime("%-m/%-d/%Y")
      expect(reviews_response[1]["overall"]).to eq review2.overall
      expect(reviews_response[1]["food"]).to eq review2.food
      expect(reviews_response[1]["service"]).to eq review2.service
      expect(reviews_response[1]["price"]).to eq review2.price
      expect(reviews_response[1]["ambience"]).to eq review2.ambience
      expect(reviews_response[1]["body"]).to eq review2.body

      expect(user_response["email"]).to eq user_one.email
      expect(user_response["screen_name"]).to eq user_one.screen_name
      expect(user_response["role"]).to eq user_one.role
    end
  end
end
