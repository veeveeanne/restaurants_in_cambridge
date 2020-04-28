require 'rails_helper'

RSpec.describe Vote, type: :model do
  it { should belong_to(:review) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:helpful) }

  it do 
    should validate_numericality_of(:helpful).
      only_integer.
      is_less_than_or_equal_to(1).
      is_greater_than_or_equal_to(0)
  end
end