require 'uri'
require 'net/http'
require 'json'

class PlacesController < ApplicationController
  before_action :set_place, only: %i[ show edit update destroy ]
# after_action :create_favorite, only: :create

  # GET /places or /places.json
  def index
    @places = Place.all
    
  end

  # GET /places/1 or /places/1.json
  def show
  end

  # GET /places/new
  def new
    @place = Place.new
    
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places or /places.json
  def create
    # TODO: consider moving "favorite" actions to favorites controller

    # TODO: consider including yelp_id (external_id)
    @place = Place.new(place_params.except(:api_id))
    # price = place_params[:price].length
    # @place.price = price
    @api_id = place_params[:api_id]
    @place.favorites.build(
      user: current_user
    )
    respond_to do |format|
      if @place.save
        format.html { redirect_to root_url, fallback_location: favorites_url, notice: "Place was successfully created." }
        format.json { render :show, status: :created, location: @place }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1 or /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to place_url(@place), notice: "Place was successfully updated." }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1 or /places/1.json
  def destroy
    @place.destroy

    respond_to do |format|
      format.html { redirect_to favorites_url, notice: "Place was successfully destroyed." }
      format.json { head :no_content }
     
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.


    def set_place
      @place = Place.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def place_params
      params.require(:place).permit(:name, :image_url, :price, :location, :category, :rating, :api_id)
    end
end
