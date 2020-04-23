class ChangePictureUrlInRestaurants < ActiveRecord::Migration[5.2]
  def change
    change_column_default :restaurants, :picture_url, from: nil, to: "https://www.crosstimbersgazette.com/crosstimbersgazette/wp-content/uploads/2016/02/restaurant-generic.jpg"
  end
end
