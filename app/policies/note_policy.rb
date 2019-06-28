class NotePolicy < ApplicationPolicy
  def create?
    user.caster
  end

  def update?
    user.caster
  end

  def create_convocation?
    user.caster
  end

  def update_convocation?
    user.caster
  end
end
