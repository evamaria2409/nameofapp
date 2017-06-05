class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :destroy, :manage, :all
    else
      can :read, :all
      cannot :destroy, :all
    end
  end

end
