module UserConcern extend ActiveSupport::Concern

def short_name
  name.split().first
end

def friends
  self.friends_a + self.friends_b
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

def is_friend_with?(user)
  self.friends.include?(user)
end

end