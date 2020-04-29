class Api::V1::VotesController < ApplicationController
  protect_from_forgery with: :null_session
  protect_from_forgery unless: -> { request.format.json? }
  before_action :authorize_user

  def create
    user = current_user
    review = Review.find(params[:review_id])
    vote = Vote.new
    vote.helpful = params[:helpful]
    vote.user = user
    vote.review = review
    vote.save
    render json: {
      vote: vote,
      reviews: serialized_reviews
    }
  end

  def update
    vote = Vote.find(params[:id])
    vote.helpful = params[:helpful]
    vote.save
    render json: {
      votes: Vote.by_current_user(current_user),
      reviews: serialized_reviews
    }
  end

  def destroy
    vote = Vote.find(params[:id])
    vote.delete
    render json: {
      votes: Vote.by_current_user(current_user),
      reviews: serialized_reviews
    }
  end

  private
  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new("not found")
    end
  end

  def serialized_reviews
    restaurant_id = Review.find(params["review_id"]).restaurant.id
    ActiveModelSerializers::SerializableResource.new(Review.reviews_of_restaurant(restaurant_id), each_serializer: ReviewSerializer)
  end

end