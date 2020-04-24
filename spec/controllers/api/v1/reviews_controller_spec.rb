require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do
  describe "GET#index" do
    let!(:restaurant1) { Restaurant.create(name: "Mr. Bartley", address: "1245 Massachusetts Ave", city: "Cambridge", state: "MA", zip: "02138", picture_url: "http://www.bu.edu/files/2012/02/h_12-4650-MRBBURGER-012.jpg") }
    let!(:restaurant2) { Restaurant.create(name: "Alden & Harlow", address: "40 Brattle Street", city: "Cambridge", state: "MA", zip: "02138", picture_url: "https://lh3.googleusercontent.com/p/AF1QipP7aYIv_U9Phmx_YgZIoJHWqkERZBhOA21_B3gY=s1600-w420-h280") }
    let!(:review1) { Review.create(overall: 5, food: 5, service: 5, price: 4, ambience: 4, body: "The food and service were all wonderful. Loved the ambience too!", restaurant: restaurant1) }
    let!(:review2) { Review.create(overall: 4, food: 4, service: 3, price: 3, body: "Great burgers here. Came here for a dinner with friends and had a great time.", restaurant: restaurant2) }

    it "returns a successful response status and a content type of json" do
      get :index

      expect(response.status).to eq 2000
      expect(response.content_type).to eq "application/json"
    end
  end
end