class Ability
  include CanCan::Ability

  def initialize(user)

    if user.nil?
      return
    end

    can :manage, User, id: user.id
    can :manage, Notification, user: {id: user.id}
    can :manage, Invitation, inviting_id: user.id
    can :manage, Invitation, invitee_id: user.id
    can :manage, Friendship, user_a_id: user.id
    can :manage, Friendship, user_b_id: user.id
    can [:show, :friends], User
    can :manage, Post, user_id: user.id
    can :manage, Image, post: {user_id: user.id}

  end

end
