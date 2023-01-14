class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, :all, user: user
  end
end
