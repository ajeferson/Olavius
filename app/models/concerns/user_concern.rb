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
  self.invitation_guest_users + self.invitation_host_users
end

def is_friend_with?(user)
  self.friends.include?(user)
end

end