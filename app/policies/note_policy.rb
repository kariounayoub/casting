class NotePolicy < ApplicationPolicy
  def create?
    user.caster
  end

  def update?
    user.caster
  end
end
