class BoatsController < ApplicationController
  before_action :find_boat, only: [ :edit, :update, :show, :destroy ]
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @boats = Boat.all
  end

  def show
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    if @boat.save
      redirect_to boat_path(@boat)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @boat.update(boat_params)
    redirect_to boat_path(@boat)
  end

  def destroy
    @boat.destroy
    # to change when we create a user page
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
