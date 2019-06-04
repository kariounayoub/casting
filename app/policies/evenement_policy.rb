class EvenementPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def edit?
    true
  end

  def create?
    return true
  end

  def update?
    return true
  end

  def activate?
    return true
  end

  def destroy?
    return true
  end
end
