json.extract! recommendation, :id, :price, :location, :rating, :category, :created_at, :updated_at
json.url recommendation_url(recommendation, format: :json)
