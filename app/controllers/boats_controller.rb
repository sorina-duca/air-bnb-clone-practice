class BoatsController < ApplicationController
  before_action :find_boat, only: [ :edit, :update, :show, :destroy ]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:location].present? && params[:capacity].present?
      @location = params[:location]
      @capacity = params[:capacity]
      @boats = policy_scope(Boat.geocoded).where('location ILIKE?', "%#{@location}%").where(capacity: @capacity)
    else
      @boats = policy_scope(Boat.geocoded).order(name: :asc)
    end
    @markers = @boats.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude,
        infoWindow: render_to_string(partial: "boat_popup", locals: { boat: boat })
      }
    end
  end

  def show
    @markers =
      {
        lat: @boat.latitude,
        lng: @boat.longitude
      }
    authorize @boat
  end

  def new
    @boat = Boat.new
    authorize @boat
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    authorize @boat
    if @boat.save
      redirect_to boat_path(@boat)
    else
      render :new
    end
  end

  def edit
    authorize @boat
  end

  def update
    @boat.update(boat_params)
    authorize @boat
    redirect_to boat_path(@boat)
  end

  def destroy
    @boat.destroy
    authorize @boat
    # to change when we create a user profile page
    redirect_to root_path
  end

  private

  def find_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:name, :description, :capacity, :location, :price, :category, :photo)
  end
end
