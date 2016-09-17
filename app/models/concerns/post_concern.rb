module PostConcern extend ActiveSupport::Concern

def belongs_to?(user)
  self.user_id == user.id
end

end