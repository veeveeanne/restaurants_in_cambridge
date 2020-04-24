class Api::V1::ReviewsController < ApplicationController
  def index
    restaurant = Restaurant.find(params[:restaurant_id])
    render json: restaurant.reviews
  end
end