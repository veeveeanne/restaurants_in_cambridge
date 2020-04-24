require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should belong_to(:restaurant) }
  it { should validate_presence_of(:overall) }
  it { should validate_presence_of(:body) }

  it do
    should validate_numericality_of(:overall).
      only_integer.
      is_greater_than_or_equal_to(1).
      is_less_than_or_equal_to(5)
  end

  it do
    should validate_numericality_of(:food).
      only_integer.
      allow_nil.
      is_greater_than_or_equal_to(1).
      is_less_than_or_equal_to(5)
  end

  it do
    should validate_numericality_of(:price).
      only_integer.
      allow_nil.
      is_greater_than_or_equal_to(1).
      is_less_than_or_equal_to(5)
  end

  it do
    should validate_numericality_of(:ambience).
      only_integer.
      allow_nil.
      is_greater_than_or_equal_to(1).
      is_less_than_or_equal_to(5)
  end

  it do
    should validate_numericality_of(:service).
      only_integer.
      allow_nil.
      is_greater_than_or_equal_to(1).
      is_less_than_or_equal_to(5)
  end
end