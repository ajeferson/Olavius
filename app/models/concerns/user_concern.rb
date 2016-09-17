module UserConcern extend ActiveSupport::Concern

def short_name
  name.split().first
end

def friends
  User.where('id IN (?)',
             self.friends_a.pluck(:id) + self.friends_b.pluck(:id))
      .order(name: :asc)
end

def invitations
  self.host_invitations + self.guest_invitations
end

def invitation_users
  self.inviting_users + self.invited_users
end

def invited?(user)
  self.invited_users.include?(user)
end

def invited_by?(user)
  user.invited_users.include?(self)
end

def invitation_for(user)
  self.host_invitations.where('invitee_id = ?', user.id).first
end

def invitation_from(user)
  self.guest_invitations.where('inviting_id = ?', user.id).first
end

def friendship_with(user)
  self.friendships_a.where('user_b_id = ?', user.id).first || self.friendships_b.where('user_a_id = ?', user.id).first
end

def is_friend_with?(user)
  self.friends.include?(user)
end

end