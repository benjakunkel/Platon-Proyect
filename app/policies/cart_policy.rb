class CartPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.user_id == user.id
  end

  def update?
    record.user_id == user.id || record.shop.user_id == user.id

  end
  
  def create?
    record.shop.user == user
  end
end
