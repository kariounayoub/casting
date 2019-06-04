class EvenementPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.admin ? scope.all : []
    end
  end

  def new?
    user.admin
  end

  def edit?
    new?
  end

  def create?
    new?
  end

  def update?
    new?
  end

  def activate?
    new?
  end

  def destroy?
    new?
  end
end
