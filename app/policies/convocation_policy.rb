class ConvocationPolicy < ApplicationPolicy
  def create?
    user.admin
  end
end
