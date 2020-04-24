class Api::V1::RestaurantsController < ApplicationController
  # before_action :authorize_user, except: [:index, :show]
  def index
    render json: Restaurant.all
  end

  def show
    render json: Restaurant.find(params[:id])
  end

  def destroy
    binding.pry
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