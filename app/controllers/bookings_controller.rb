class BookingsController < ApplicationController
  before_action :set_booking, only: [:show :edit, :update, :destroy]
  before_action :set_boat, only: [:new :create ]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user.id
    @booking.boat = params[:boat_id]
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to user_booking_path(@booking.user)
  end

  def destroy
    @booking.destroy
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
