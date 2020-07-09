class ProfilesController < ApplicationController
  before_action :find_profile_user, only: %i[show edit update]
  # before_action :find_user_boat, only: %i[index]

  def my_boats
    @boats = Boat.where(user: current_user.id)
    authorize @boats
  end

  def show; end

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

  def finde_user_boat
    @boat = Boat.find(current_user.id)
    authorize @boat
  end

  def profile_user_params
    params.require(:user).permit(:name, :email, :bio, :photo)
  end
end
