class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.string :name
      t.string :image_url
      t.string :price
      t.string :location
      t.string :categories
      t.string :review_count
      t.string :transactions
      t.float :rating
      t.string :display_phone
      t.references :user, null: false, foreign_key: true
      t.string :yelp_id

      t.timestamps
    end
  end
end
