class FavoritesController < ApplicationController
  before_action :set_favorite, only: %i[ show edit update destroy ]
  before_action { authorize(@favorite || Favorite) }

  def index
    @favorites = current_user.favorites
  end

  def show
    yelp_client = YelpClient.new
    @yelp_place = yelp_client.get_business(@favorite.yelp_id)
    @yelp_reviews = YelpClient.new.get_reviews(@favorite.yelp_id)
  end

  def new
    @favorite = Favorite.new
  end

  def edit
  end

  def create
    @favorite = current_user.favorites.build(favorite_params)

    respond_to do |format|
      if @favorite.save
        format.html { redirect_to favorite_url(@favorite), notice: "Favorite was successfully created." }
        format.json { render :show, status: :created, location: @favorite }
        format.js
      else
        format.js { render :create, status: :unprocessable_entity }
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @favorite.update(favorite_params)
        format.html { redirect_to favorite_url(@favorite), notice: "Favorite was successfully updated." }
        format.json { render :show, status: :ok, location: @favorite }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @favorite.destroy

    respond_to do |format|
      format.html { redirect_to favorites_url, notice: "Favorite was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  private

  def set_favorite
    begin
      @favorite = Favorite.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to favorites_path, alert: "The favorite has already been deleted!"

      return
    end
  end

  def favorite_params
    params.require(:favorite).permit(:name, :image_url, :price, :location, :categories, :rating, :review_count, :transactions, :display_phone, :yelp_id)
  end
end
