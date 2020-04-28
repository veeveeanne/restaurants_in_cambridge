class RestaurantShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :state, :zip, :picture_url, :website

  has_many :reviews
end
