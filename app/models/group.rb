class Group < ActiveRecord::Base

  belongs_to :owner, class_name: 'User', inverse_of: :groups

end
