class ReviewsController < ApplicationController
  before_action :find_boat

  def new
    @reviews = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.boat = @boat
    @review.save
    redirect_to boat_path(@boat)
  end

  private

  def find_boat
    @boat = Boat.find(params[:boat_id])
  end

  def review_params
    params.require(:review).permite(:content, :rating)
  end
end
