class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :update, :destroy, to: :modify

    user ||= User.new # guest user (not logged in)


    if user.has_role? :exec then
      can :manage, :all
    else
      user.roles.first.permissions.each { |permission| can permission.action.to_sym, permission.subject.classify.constantize }
    end
  end
end
