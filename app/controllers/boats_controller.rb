class BoatsController < ApplicationController
  before_action :find_boat, only: %i[edit update show destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @location = params[:location]
    @capacity = params[:capacity]
    @check_in = params[:checkin]
    @check_out = params[:checkout]

    boats_query = policy_scope(Boat.geocoded).order(name: :asc)
    boats_query = boats_query.where('location ILIKE?', "%#{@location}%") if params[:location].present?
    boats_query = boats_query.where(capacity: @capacity) if params[:capacity].present?
    if params[:checkin].present? && params[:checkout].present?
      boats_query = boats_query.select { |boat| boat_available?(@check_in, @check_out, boat) }
    end
    @boats = boats_query

    @markers = @boats.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude,
        infoWindow: render_to_string(partial: "boat_popup", locals: { boat: boat })
      }
    end
  end

  def show
    @users = User.all
    @markers =
      {
        lat: @boat.latitude,
        lng: @boat.longitude
      }
    authorize @boat
    @booking = Booking.new
    @unavailable_dates = Booking.where(boat_id: @boat.id).map do |booking|
      { from: booking.checkin, to: booking.checkout }
    end
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

  def boat_available?(check_in, check_out, boat)
    boat.bookings.none? do |booking|
      check_in < booking.checkout && check_out > booking.checkin
    end
  end
end
