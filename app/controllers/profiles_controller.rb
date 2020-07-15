class ProfilesController < ApplicationController
  before_action :set_user, only: %i[show edit update my_requests]

  def my_boats
    @boats = Boat.where(user: current_user.id)
    authorize @boats
  end

  def my_requests
    authorize @user
  end

  def index
    @boats = Boat.where(user: current_user.id)
    @booking = @boats.booking
  end

  def show
    authorize @user
    @boat = Boat.find_by(user: current_user.id)
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update(profile_user_params)
      redirect_to profile_path(current_user.id)
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def profile_user_params
    params.require(:user).permit(:name, :email, :bio, :photo)
  end
end
