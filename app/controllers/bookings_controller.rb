class BookingsController < ApplicationController

  before_action :find_booking, only: [:show, :edit, :update]
  before_action :find_boat, only: [:new, :create]
  before_action :authenticate_user!, only: [:new, :create]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bookings = policy_scope(Booking).order(checkin: :asc)


  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.boat = Boat.find(params[:boat_id])
    @booking.status = "pending"
    authorize @booking


    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    authorize @booking
  end

  def edit
    authorize @booking
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
    authorize @booking
  end

  def cancel
    @booking.status = "cancelled"
    authorize @booking
  end

  # def approve
  #   @booking.status = "approved"
  #   authorize @booking
  # end

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
