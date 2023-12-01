class YelpPlacesController < ApplicationController
  # GET /searches or /searches.json
  def index
    @yelp_places = if params[:commit] == "I'm feeling lucky"
                    [YelpClient.new.random_business]
                  else
                    YelpClient.new.search_businesses(search_params)
                  end

    YelpPlace.decorate_with_saved_flag(@yelp_places, current_user)
  end

  def show
    yelp_id = params[:id]
    @yelp_place = YelpClient.new.get_business(yelp_id)
    @yelp_reviews = YelpClient.new.get_reviews(yelp_id)
    # TODO: maybe this could be a 1-liner (eg Favorite.new.merge(@yelp_place))
    @favorite = Favorite.new(
      name: @yelp_place["name"],
      image_url: @yelp_place["image_url"],
      price: @yelp_place["price"],
      location: "#{@yelp_place["location"]["city"]}, #{@yelp_place["location"]["state"]}",
      rating: @yelp_place["rating"],
      yelp_id: @yelp_place["id"] 
    )
  end

  private
  def search_params
    params.permit(:location, :categories)
  end
end
