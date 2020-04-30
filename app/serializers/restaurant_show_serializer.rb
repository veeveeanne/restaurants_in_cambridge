class RestaurantShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :state, :zip, :picture_url, :website, :votes, :scope

  has_many :reviews

  def votes
    Vote.by_current_user(scope)
  end
end
