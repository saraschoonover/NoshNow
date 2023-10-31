require 'uri'
require 'net/http'
require 'json'

class PlacesController < ApplicationController
  before_action :set_place, only: %i[ show edit update destroy ]


  def home
    render "places/home"
  end

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

  # TODO: move to SearchController#index
  # TODO: move to YelpClient service object eg YelpClient.new.search(query)
  def query
    query_string = {
      location: params.fetch("location"),
      price: params.fetch("price").to_i,
      limit: 20,
      sort_by: "best_match",
      categories: "restaurants",
      term: "restaurants"
    }.to_query
    pp query_string
    base_url = "https://api.yelp.com/v3"

    url = URI("#{base_url}/businesses/search?#{query_string}")

    api_key = ENV.fetch("YELP_KEY")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    
    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    request["Authorization"] = "Bearer #{api_key}"
    
    response = http.request(request)
    actual_response = response.read_body
    @restaurants = JSON.parse(actual_response).fetch("businesses")
    
    render "places/results"
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places or /places.json
  def create
    @place = Place.new(place_params)
    pp @place.name
    respond_to do |format|
      if @place.save
        format.html { redirect_to place_url(@place), notice: "Place was successfully created." }
        format.json { render :show, status: :created, location: @place }
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
      format.html { redirect_to places_url, notice: "Place was successfully destroyed." }
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
      params.require(:place).permit(:name, :image_url, :price, :location, :category, :rating)
    end
end
