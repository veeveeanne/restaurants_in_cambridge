class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :overall, null: false
      t.integer :food, null: false
      t.integer :ambience, null: false
      t.integer :service, null: false
      t.integer :price, null: false
      t.string :body
      t.belongs_to :restaurant, null: false

      t.timestamps null: false
    end
  end
end
