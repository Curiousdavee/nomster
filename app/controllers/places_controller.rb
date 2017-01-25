class PlacesController < ApplicationController

  def index
    #@places = Place.all
    @places = Place.all.paginate(:page => params[:page], :per_page => 10)
    @places_last = Place.last
  end

  def new
    @places = Place.new
    #need to build a blank place so we can make a form for that particular thing.
  end

end