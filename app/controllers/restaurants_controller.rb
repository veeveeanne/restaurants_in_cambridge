class RestaurantsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
    binding.pry
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.default
    # binding.pry   
    # if params[:picture_url].nil?
    #   @restaurant[:picture_url] = "https://www.crosstimbersgazette.com/crosstimbersgazette/wp-content/uploads/2016/02/restaurant-generic.jpg"
    # else
    #   @restaurant[:picture_url] = picture_params[:picture_url]
    #   binding.pry
    # end
    binding.pry
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

  # def picture_params
  #   params.require(:restaurant).permit(:picture_url)
  # end
end
