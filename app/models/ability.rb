class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :update, :destroy, to: :modify

    user ||= User.new

    if user.has_role? :exec then
      can :manage, :all
    else
      user.role_permissions.each { |permission| can permission.action.to_sym, permission.subject.classify.constantize }
    end
  end
end
