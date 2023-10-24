json.extract! place, :id, :name, :image_url, :price, :location, :category, :rating, :created_at, :updated_at
json.url place_url(place, format: :json)
