class Api::V1::BoatsController < Api::V1::BaseController

  def index
    @location = params[:location]
    @capacity = params[:capacity]
    @check_in = params[:checkin]
    @check_out = params[:checkout]

    boats_query = policy_scope(Boat.geocoded).order(name: :asc)
    boats_query = boats_query.where('location ILIKE?', "%#{@location}%") if params[:location].present?
    boats_query = boats_query.where(capacity: @capacity) if params[:capacity].present?
    if params[:checkin].present? && params[:checkout].present?
      boats_query = boats_query.select { |boat| boat_available?(@check_in, @check_out, boat) }
    end
    @boats = boats_query
  end
end
