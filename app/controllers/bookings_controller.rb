class BookingsController < ApplicationController
  before_action :set_booking, only: [:show :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = params[:user_id]
    @booking.boat = @boat
    if @booking.save
      redirect_to user_bookings_path(@user)
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
    @booking = Booking.find(params[:booking_id])
  end

  def booking_params
    params.require(:booking).permit(:checkin, :checkout, :status, :booking_price)
  end

end
