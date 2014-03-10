class UserPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end

  def create?
   user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
