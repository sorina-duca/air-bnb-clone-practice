class ProfilesController < ApplicationController
  before_action :find_profile_user, only: %i[show edit update my_requests]

  def my_boats
    @boats = Boat.where(user: current_user.id)
    authorize @boats
  end

  def my_requests
  end

  def index
    @boats = Boat.find_by(user: current_user.id)
    @booking = @boats.booking
  end

  def show
    @boat = Boat.find_by(user: current_user.id)
  end

  def edit; end

  def update
    authorize @user
    if @user.update(profile_user_params)
      redirect_to profile_path(current_user.id)
    else
      render :new
    end
  end

  private

  def find_profile_user
    @user = User.find(current_user.id)
    authorize @user
  end

  def profile_user_params
    params.require(:user).permit(:name, :email, :bio, :photo)
  end
end
