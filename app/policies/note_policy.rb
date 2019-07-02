class NotePolicy < ApplicationPolicy
  def create?
    user.caster || user.admin
  end

  def update?
    user.caster || user.admin
  end

  def create_convocation?
    user.caster || user.admin
  end

  def update_convocation?
    user.caster || user.admin
  end
end
