class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # we want to require a user to be logged in only for the new and create actions

  def index
    #@places = Place.all
    @places = Place.all.paginate(:page => params[:page], :per_page => 10)
    @places_last = Place.last
  end

  def new
    @place = Place.new
    #need to build a blank place so we can make a form for that particular thing.
    #place is a variable that holds an instance of a Place class
  end

  def create
    @place = current_user.places.create(place_params)

    if @place.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  def show
    @place = Place.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @place = Place.find(params[:id])
    if current_user != @place.user
      return render text: 'Not Allowed', status: :forbidden
    end

  end

  def update
    @place = Place.find(params[:id])
    if current_user != @place.user
      return render text: 'Not Allowed', status: :forbidden
    end

    @place.update_attributes(place_params)

    if @place.valid?
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end

    @place.destroy
    redirect_to root_path

  end

  private
  # anything below, this is something that can be used
  # inside the controller, but it isn't an actual page

  def place_params
    params.require(:place).permit(:name, :description, :address)
    # gather info from the place form
  end

end