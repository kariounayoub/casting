class ConvocationPolicy < ApplicationPolicy
  def create?
    user.admin
  end

  def present?
    user.admin || user.caster
  end
end
