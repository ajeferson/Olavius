module UserConcern extend ActiveSupport::Concern

  def short_name
    name.split().first
  end

  def friends
    self.friends_a + self.friends_b
  end

  def is_friend_with?(user)
    self.friends.include?(user)
  end

end