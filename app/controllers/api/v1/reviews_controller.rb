class Api::V1::ReviewsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    restaurant = Restaurant.find(params[:restaurant_id])
    render json: restaurant.reviews
  end

  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    
    user = current_user
    review = Review.new(review_params)
    review.restaurant = restaurant
    review.user = user
    
    if review.save
      render json: { review: review }
    else
      render json: { error: review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def review_params
    params.require(:review).permit(:overall, :food, :ambience, :service, :body)
  end
end