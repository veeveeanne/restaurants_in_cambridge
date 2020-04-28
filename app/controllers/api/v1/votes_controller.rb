class Api::V1::VotesController < ApplicationController
  protect_from_forgery with: :null_session
  protect_from_forgery unless: -> { request.format.json? }
  before_action :authorize_user

  def create
    user = current_user
    review = Review.find(params[:review_id])
    @vote = Vote.new
    @vote.helpful = params[:helpful]
    @vote.user = user
    @vote.review = review
    @vote.save
    render json: @vote
  end

  def edit
    binding.pry
    @vote = Vote.find(params[:id])
    @vote.helpful = params[:something]
    @vote.save
  end

  def destroy
    binding.pry
    @vote = Vote.find(params[:id])
    @vote.delete
    render json: {}, status: :no_content
  end

  private
  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new("not found")
    end
  end

end