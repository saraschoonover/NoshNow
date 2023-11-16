class YelpClient
  BASE_URL = "https://api.yelp.com/v3".freeze

  def initialize
    @api_key = ENV['YELP_KEY']
  end

  def search_businesses(params = {})
  location = params.fetch("location", "Chicago")
  categories = params.fetch("categories", "restaurants")

  query_string = {
    location: location,
    price: "1, 2, 3, 4",
    limit: 20,
    sort_by: "best_match",
    categories: categories,
    rating: "ratings",
    review_count: "review-count",
    open_now: true
  }.to_query
  url = URI("#{BASE_URL}/businesses/search?#{query_string}")

  fetch(url).fetch("businesses") || []
  end

  def random_business
    # TODO: return an array of 1 business
    businesses = search_businesses
    businesses.sample
  end


 
  private

  def fetch(url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    
    request = Net::HTTP::Get.new(url)
    request["accept"] = "application/json"
    request["Authorization"] = "Bearer #{@api_key}"
    
    response = http.request(request)

    JSON.parse(response.read_body)
  end
end
