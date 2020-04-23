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
  
    it "returns a successful response status and a content type of json" do
      get :show, params: {id: restaurant_one.id}

      expect(response.status).to eq 200
      expect(response.content_type).to eq "application/json"
    end

    it "returns a restaurant's information in the data base" do
      get :show, params: {id: restaurant_one.id}

      response_body = JSON.parse(response.body)

      expect(response_body.length).to equal 9
      expect(response_body["name"]).to eq restaurant_one.name
      expect(response_body["address"]).to eq restaurant_one.address
      expect(response_body["city"]).to eq restaurant_one.city
      expect(response_body["state"]).to eq restaurant_one.state
      expect(response_body["zip"]).to eq restaurant_one.zip
      expect(response_body["picture_url"]).to eq restaurant_one.picture_url
    end
  end
end
