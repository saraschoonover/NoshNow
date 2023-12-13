class YelpPlacesController < ApplicationController
  before_action { authorize(@yelp_place || YelpPlace) }

  def index
    @yelp_places = if params[:commit] == "I'm feeling lucky"
        [YelpClient.new.random_business]
      else
        YelpClient.new.search_businesses(search_params)
      end

    YelpPlace.decorate_with_saved_flag(@yelp_places, current_user)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    yelp_id = params[:id]
    @yelp_place = YelpClient.new.get_business(yelp_id)
    @yelp_reviews = YelpClient.new.get_reviews(yelp_id)

    @favorite = Favorite.new(
      name: @yelp_place["name"],
      image_url: @yelp_place["image_url"],
      price: @yelp_place["price"],
      location: "#{@yelp_place["location"]["city"]}, #{@yelp_place["location"]["state"]}",
      rating: @yelp_place["rating"],
      categories: @yelp_place["categories"],
      transactions: @yelp_place["transactions"],
      review_count: @yelp_place["review_count"],
      display_phone: @yelp_place["display_phone"],
      yelp_id: @yelp_place["id"],
    )
  end

  private

  def search_params
    params.permit(:location, :categories)
  end
end
