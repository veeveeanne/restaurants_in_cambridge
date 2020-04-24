class Review < ApplicationRecord
  belongs_to :restaurant

  validates :overall, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :food, numericality: { only_integer: true, allow_nil: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :price, numericality: { only_integer: true, allow_nil: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :ambience, numericality: { only_integer: true, allow_nil: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :service, numericality: { only_integer: true, allow_nil: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :body, presence: true
end