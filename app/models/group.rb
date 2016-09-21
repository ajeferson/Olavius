class Group < ActiveRecord::Base

  belongs_to :owner, class_name: 'User', inverse_of: :groups
  has_and_belongs_to_many :users

end
