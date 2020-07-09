class BookingsController < ApplicationController
  # skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_booking, only: %i[show edit update]
  before_action :set_boat, only: %i[new create]
  # before_action :authenticate_user!, only: %i[new create]

  def index
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    # authorize @booking
    @booking.user = current_user
    @booking.boat = Boat.find(params[:boat_id])
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    # authorize @booking
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to user_booking_path(@booking.user)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:checkin, :checkout, :status, :booking_price)
  end

  def set_boat
    @boat = Boat.find(params[:boat_id])
  end
end
