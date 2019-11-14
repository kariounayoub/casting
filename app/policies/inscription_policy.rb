class InscriptionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin
        scope.where(evenement: Evenement.where(actif: true).last)
      else
        scope.where(user: user, evenement: Evenement.where(actif: true).last)
      end
    end
  end

  def show?
    user.admin || record.user == user || user.caster
  end

  def new?
    true
  end

  def edit?
    user.admin || record.user == user
  end

  def create?
    new?
  end

  def update?
    user.admin || record.user == user
  end

  def destroy?
    user.admin || record.user == user
  end
end
