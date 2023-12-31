require "net/http"

class YelpClient
  BASE_URL = "https://api.yelp.com/v3".freeze

  def initialize
    @api_key = ENV["YELP_KEY"]
  end

  def search_businesses(params = {})
    # removes empty string values
    params.compact_blank!
    location = params.fetch("location", "Chicago")
    categories = params.fetch("categories", "restaurants")

    query_params = {
      location: location,
      price: "1,2,3,4",
      limit: 20,
      sort_by: "best_match",
      categories: categories,
      open_now: true,
    }
    query_string = URI.encode_www_form(query_params)
    url = URI("#{BASE_URL}/businesses/search?#{query_string}")

    fetch(url).fetch("businesses") || []
  end

  def get_reviews(yelp_id)
    url = URI("#{BASE_URL}/businesses/#{yelp_id}/reviews?limit=2&sort_by=yelp_sort")
    fetch(url).fetch("reviews")
  end

  def random_business
    businesses = search_businesses
    businesses.sample
  end

  def get_business(yelp_id)
    url = URI("#{BASE_URL}/businesses/#{yelp_id}")
    fetch(url)
  end

  def get_location(yelp_id)
    url = URI("#{BASE_URL}/businesses/#{yelp_id}")
    fetch(url).fetch("coordinates")
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
