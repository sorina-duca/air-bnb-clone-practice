class BookingsController < ApplicationController

  before_action :find_booking, only: [:show, :edit, :update]
  before_action :find_boat, only: [:new, :create, :show, :edit]
  before_action :authenticate_user!, only: [:new, :create]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bookings = policy_scope(Booking).order(checkin: :asc)
  end

  def new
    @booking = Booking.new
    authorize @booking
    @unavailable_dates = Booking.where(boat_id: @boat.id).map do |booking|
      { from: booking.checkin, to: booking.checkout }
    end
    # when we have a method for accepting a booking, we should change so that only accepted booking dates are disabled
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.boat = @boat
    @booking.status = "pending"

    @booking.booking_price = @boat.price * (@booking.checkout - @booking.checkin).to_i / (24 * 60 * 60)
    authorize @booking
    if @booking.save
      redirect_to boat_booking_path(@boat,@booking)
    else
      render :new
    end
  end

  def show
    @markers =
      {
        lat: @booking.boat.latitude,
        lng: @booking.boat.longitude
      }
    authorize @booking
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    @booking.update(booking_params)
    redirect_to boat_booking_path(@booking.boat)
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:checkin, :checkout, :status, :booking_price)
  end

  def find_boat
    @boat = Boat.find(params[:boat_id])
  end

end
