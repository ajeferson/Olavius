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

    can :read, Post do |post|
      post.belongs_to?(user) || post.user.is_friend_with?(user)
    end

    can :create, Comment do |comment|
      comment.post.belongs_to?(user) || comment.post.user.is_friend_with?(user)
    end

    can :manage, Image, post: {user_id: user.id}

  end

end
