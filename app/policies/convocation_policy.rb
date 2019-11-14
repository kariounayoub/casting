class ConvocationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin
        scope.joins(:inscription).where(inscriptions: {evenement: Evenement.where(actif: true).last})
      else
        scope..joins(:inscription).where(inscriptions: {user: user, evenement: Evenement.where(actif: true).last})
      end
    end
  end

  def create?
    user.admin
  end

  def present?
    user.admin || user.caster
  end
end
