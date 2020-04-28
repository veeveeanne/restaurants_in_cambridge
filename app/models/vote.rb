class Vote < ApplicationRecord
  belongs_to :review
  belongs_to :user

  validates :helpful, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
end