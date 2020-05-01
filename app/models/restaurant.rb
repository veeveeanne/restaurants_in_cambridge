class Restaurant < ApplicationRecord
  has_many :reviews

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true

  def default
    if picture_url == ""
      picture_url = "https://www.crosstimbersgazette.com/crosstimbersgazette/wp-content/uploads/2016/02/restaurant-generic.jpg"
    end
  end
end