class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :update, :destroy, to: :modify

    user ||= User.new

    if user.has_role? :admin then
      can :manage, :all
    else
      can :read, :user, id: user.id
      if user.role_permissions
       user.role_permissions.each { |permission| can permission.action.to_sym, permission.subject.classify.constantize }
      end
    end
  end
end
