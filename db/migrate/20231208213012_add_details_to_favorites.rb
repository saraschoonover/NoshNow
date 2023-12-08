class AddDetailsToFavorites < ActiveRecord::Migration[7.0]
  def change
    add_column :favorites, :review_count, :string
    add_column :favorites, :transactions, :string
    add_column :favorites, :display_phone, :string
  end
end
