class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :overall, null: false
      t.integer :food
      t.integer :price
      t.integer :ambience
      t.integer :service
      t.text :body, null: false
      t.belongs_to :restaurant, null: false

      t.timestamps null: false
    end
  end
end
