class UserPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end

  def show?
    permissions.include?('read')
  end

  def create?
   permissions.include?('manage') || permissions.include?('modify')
  end

  def update?
   permissions.include?('manage') || permissions.include?('modify')
  end

  def destroy?
    false
  end

  private
   def permissions
     @permissions ||= user.role.permissions.per_subject(record.class.to_s.downcase).map(&:action)
   end
end
