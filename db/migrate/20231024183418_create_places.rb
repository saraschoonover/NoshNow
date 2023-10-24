class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :image_url
      t.integer :price
      t.string :location
      t.string :category
      t.float :rating

      t.timestamps
    end
  end
end