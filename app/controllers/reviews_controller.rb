class ReviewsController < ApplicationController
  before_action :find_boat

  def new
    @reviews = Review.new
    authorize @reviews
  end

  def create
    @review = Review.new(review_params)
    @review.boat = @boat
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to boat_path(@boat)
    else
      render :new
    end
  end

  private

  def find_boat
    @boat = Boat.find(params[:boat_id])
    authorize @boat
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
