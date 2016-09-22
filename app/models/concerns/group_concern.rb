module GroupConcern extend ActiveSupport::Concern

def all_members
  user_ids = self.users.pluck(:id) + [self.owner_id]
  User.where('id IN (?)', user_ids).order(name: :asc)
end

end