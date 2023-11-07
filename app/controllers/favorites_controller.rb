class FavoritesController < ApplicationController

  def index
    @favorite_places = current_user.favorites.map(&:place)
  end

  def create
    @favorite = current_user.favorites.new(favorite_params)
    if @favorite.save
      redirect_to favorites_path, notice: "Place favorited successfully."
    else
      redirect_to favorites_path, alert: "Failed to favorite the place."
    end
  end

  def destroy
    @place = Place.find(params[:place_id])
    @favorite = current_user.favorites.find_by(place: @place) 

    if @favorite
      @favorite.destroy 
      redirect_to @place, notice: "Place unfavorited successfully."
    else
      redirect_to @place, alert: "Failed to unfavorite the place."
    end
  end

  def favorite_params
    params.require(:place).permit(:name, :image_url, :price, :location, :category, :rating)
  end

end
