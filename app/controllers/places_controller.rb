class PlacesController < ApplicationController

  def index
    #@places = Place.all
    @places = Place.all.paginate(:page => params[:page], :per_page => 10)
    @places_last = Place.last
  end

  def new
    @place = Place.new
    #need to build a blank place so we can make a form for that particular thing.
  end

  def create
    Place.create(place_params)
    redirect_to root_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end
end