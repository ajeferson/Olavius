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

def feed
  user_ids = self.friends.pluck(:id)
  user_ids << self.id
  Post.where('user_id IN (?)', user_ids).order(created_at: :desc)
end

def liked?(post)
  self.liked_posts.include?(post)
end

def like_for(post)
  self.likes.where('post_id = ?', post.id).first
end

def owner_of?(group)
  self.id == group.owner_id
end

def member_of?(group)
  self.groups.include?(group)
end

end