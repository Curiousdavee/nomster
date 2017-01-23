class PlacesController < ApplicationController

  def index
    @places = Place.all
    @posts = Place.all.paginate(:page => params[:page], :total_entries => 100, :per_page => 10)
    @places_last = Place.last
  end
end