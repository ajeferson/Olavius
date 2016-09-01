class Ability
  include CanCan::Ability

  def initialize(user)

    if user.nil?
      return
    end

    can :manage, User, id: user.id
    can :manage, Post, user_id: user.id

  end

end
