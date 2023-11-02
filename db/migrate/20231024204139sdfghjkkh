class CreateRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :recommendations do |t|
      t.integer :price
      t.string :location
      t.float :rating
      t.string :category

      t.timestamps
    end
  end
end
