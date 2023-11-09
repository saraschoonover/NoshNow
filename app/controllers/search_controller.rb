class SearchController < ApplicationController
  # GET /searches or /searches.json
  def index
    query_string = {
      location: search_params.fetch("location", "Chicago"),
      # price: "price".to_i,
      limit: 20,
      sort_by: "best_match",
      categories: search_params.fetch("categories", "restaurants"),
      rating: "ratings",
      review_count: "review-count",
      
      #term: "tacos"
    }.to_query
    base_url = "https://api.yelp.com/v3"

    url = URI("#{base_url}/businesses/search?#{query_string}")

    api_key = ENV.fetch("YELP_KEY")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    
    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    request["Authorization"] = "Bearer #{api_key}"
    
    response = http.request(request)
    actual_response = response.read_body
    @restaurants = JSON.parse(actual_response).fetch("businesses")
    pp @restaurants
  end

  private

  def search_params
    params.permit(:location, :categories)
  end
end
