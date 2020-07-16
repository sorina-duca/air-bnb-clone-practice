class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where(sender_id: user)
      scope.all
    end
  end

  def create?
    true
  end
end
