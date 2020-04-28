class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :user_screen_name, :formatted_date, :overall, :food, :price, :ambience, :service, :body
end
