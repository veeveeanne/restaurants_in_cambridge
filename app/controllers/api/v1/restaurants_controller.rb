class Api::V1::RestaurantsController < ApplicationController
  protect_from_forgery with: :null_session
  protect_from_forgery unless: -> { request.format.json? }
  before_action :authorize_user, except: [:index, :show]
  
  def index
    render json: Restaurant.all
  end

  def show
    restaurant = Restaurant.find(params[:id])
    user = current_user
    render json: { restaurant: restaurant, user: user }
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    render json: {}, status: :no_content
  end

  private 
  def authorize_user
    if !current_user.admin?
      raise ActionController::RoutingError.new("not found")
    end
  end
end