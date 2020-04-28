class AddUserToReviews < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to :reviews, :user, null: false
  end
end
