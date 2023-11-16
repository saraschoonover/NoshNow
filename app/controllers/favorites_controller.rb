class FavoritesController < ApplicationController

  def index
    @favorite_places = current_user.favorites.map(&:place)
  end

  def create
    # @favorite = current_user.favorites.build(favorite_params[:place])
    
    # if @favorite.save
    #   redirect_to favorites_url, notice: "Place favorited successfully."
    # else
    #   redirect_to favorites_url, alert: "Failed to favorite the place."
    # end
  end

  def destroy
    @favorite = current_user.favorites.find_by(place_id: params[:id])

    respond_to do |format|
      if @favorite
        @favorite.destroy
        format.html { redirect_back favorites_url, fallback_location: root_url, notice: "Place unfavorited successfully." }
        format.json { render :show, status: :created, location: @place }
        format.js
      else
        redirect_to favorites_url, fallback_location: favorites_url, alert: "Failed to unfavorite the place."
      end
    end
  end

  def favorite_params
    params.require(:place).permit(:name, :image_url, :price, :location, :category, :rating)
  end

end
