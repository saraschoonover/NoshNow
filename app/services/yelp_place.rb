class YelpPlace

  # def initialize(place)
  #   @place = place
  # end


  # def saved?(current_user)
  #   current_user.Favorite.exists?(yelp_id: @place["id"])
  # end

    def self.decorate_with_saved_flag(yelp_places, current_user)
      yelp_places.each do |place|
        place["saved"] = current_user.favorites.exists?(yelp_id: place["id"])
      end
    end
end
