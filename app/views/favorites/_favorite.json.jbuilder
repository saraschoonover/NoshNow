json.extract! favorite, :id, :name, :image_url, :price, :location, :category, :rating, :user_id_id, :yelp_id, :created_at, :updated_at
json.url favorite_url(favorite, format: :json)
