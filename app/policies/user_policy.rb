class UserPolicy < ApplicationPolicy
  def dashboard?
    user.caster || user.admin
  end

  def casting?
    user.caster || user.admin
  end
end
