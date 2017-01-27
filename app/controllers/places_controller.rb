class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

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
    current_user.places.create(place_params)
    redirect_to root_path
  end

  private
  # anything below, this is something that can be used
  # inside the controller, but it isn't an actual page

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end
end