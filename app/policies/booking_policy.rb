class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def index
    show
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.user || User.find_by(id: @booking.boat.user_id)  == user
  end

end
