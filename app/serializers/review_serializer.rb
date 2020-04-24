class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :overall, :food, :price, :ambience, :service, :body
end
