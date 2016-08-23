class Ability
  include CanCan::Ability

  def initialize(user)

    if user.nil?
      return
    end

    can :manage, User, id: user.id

  end

end
