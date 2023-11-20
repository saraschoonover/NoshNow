class SearchController < ApplicationController
  # GET /searches or /searches.json
  def index
    @restaurants = if params[:commit] == "I'm feeling lucky"
                    YelpClient.new.random_business
                  else
                    YelpClient.new.search_businesses(search_params)
                  end
  end

  def show
    yelp_id = params[:id]
    @restaurant = YelpClient.new.get_business(yelp_id)
  end

  private

  def search_params
    params.permit(:location, :categories)
  end
end
