class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.integer :score
      t.string :restaurant
      t.integer :price
      t.string :cuisine

      t.timestamps
    end
  end
end
