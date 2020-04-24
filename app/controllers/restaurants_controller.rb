class RestaurantsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      flash[:success] = "Restaurant successfully added"
      redirect_to restaurants_path
    else
      flash.now[:error] = @restaurant.errors.full_messages.to_sentence
      render :new
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zip, :picture_url, :website)
  end
end
