class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :user_screen_name, :formatted_date, :overall, :food, :price, :ambience, :service, :body

  has_many :votes

  # custommethod
  # def user_vote
  # check for current_user
  # check if current_user has voted for the review
end
